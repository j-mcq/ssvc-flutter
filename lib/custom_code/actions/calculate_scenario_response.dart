// Automatic FlutterFlow imports
import 'package:maps_toolkit/maps_toolkit.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:maps_toolkit/maps_toolkit.dart' as mtk;

Future<String?> calculateScenarioResponse(
    DocumentReference scenarioReference) async {
  // Add your function code here!
  try {
    // delete previous scenario results
    deletePreviousResults(scenarioReference);

    final psrRecords = await queryPsrRecordOnce();

    final polygonRecords = await queryPolygonPointsRecordOnce(
        parent: scenarioReference,
        queryBuilder: (query) => query.orderBy('index'));

    final circleRecords =
        await queryCirclesRecordOnce(parent: scenarioReference);

    final scenarioRecord =
        await ScenarioRecord.getDocumentOnce(scenarioReference);
    final outageDuration = scenarioRecord.outageDuration;

    if (outageDuration == null) {
      return 'Scenario duration is not set';
    }

    // get polygon centroid to check nearest depot
    final nearestDepot = await getNearestDepot(
        polygonRecords.map((e) => mtk.LatLng(e.latitude, e.longitude)));

    List<PsrRecord> impactedPsrHouseholds = [];

    // check if households are in outage area
    for (var household in psrRecords) {
      if (household.latitude == null || household.longitude == null) {
        continue;
      }

      if (polygonRecords.length > 0) {
        final isInPolygon = checkLocationIsInPolygon(
            mtk.LatLng(household.latitude!, household.longitude!),
            polygonRecords);
        if (isInPolygon) {
          impactedPsrHouseholds.add(household);
        }
      }
      if (circleRecords.length > 0) {
        final isInPolygon = checkLocationIsInCircle(
            mtk.LatLng(household.latitude!, household.longitude!),
            circleRecords);
        if (isInPolygon) {
          impactedPsrHouseholds.add(household);
        }
      }
    }

    final psrCategoryOptionsRecords = await queryPsrCategoryOptionsRecordOnce();

    var totalCost = 0.0;
    var totalResponseItems = 0.0;
    List<ResponseItemsRecord> recommendedResponseItems = [];

    final responseItemOptions = await queryResponseItemsRecordOnce();

    for (var psrHousehold in impactedPsrHouseholds) {
      final mappedPsrCategory =
          await getPsrCategoryData(psrHousehold, psrCategoryOptionsRecords);

      double householdPowerConsumption =
          mappedPsrCategory.powerConsumption * outageDuration;

      RecommendedResponseItem recommendedResponseItem =
          await calculateResponseItem(
              householdPowerConsumption, responseItemOptions);

      if (recommendedResponseItem.responseItem != null) {
        recommendedResponseItems.add(recommendedResponseItem.responseItem!);
        totalCost += recommendedResponseItem.responseItem!.unitPrice;
        totalResponseItems += 1;

        final createScenarioHouseholdResponsesCreateData =
            createScenarioHouseholdResponsesRecordData(
                cost: recommendedResponseItem.responseItem!.unitPrice,
                responseItemName: recommendedResponseItem.responseItem!.name,
                responseItem: recommendedResponseItem.responseItem!.reference,
                postcode: psrHousehold.postcode,
                psrCategories: mappedPsrCategory.names,
                scenario: scenarioReference,
                powerRequired: householdPowerConsumption,
                highestResilienceScore: mappedPsrCategory.maxResilienceScore,
                needsRecharging: recommendedResponseItem.needsRecharging);

        var scenarioHouseholdResponsesRecordReference =
            ScenarioHouseholdResponsesRecord.createDoc(scenarioReference);
        await scenarioHouseholdResponsesRecordReference
            .set(createScenarioHouseholdResponsesCreateData);
      }
    }

    final responseCoverage = await calculateResponseCoverage(
        scenarioReference, nearestDepot.reference, recommendedResponseItems);

    saveScenarioResults(
        scenarioReference,
        impactedPsrHouseholds.length,
        totalCost,
        totalResponseItems,
        responseCoverage,
        nearestDepot.reference,
        nearestDepot.name);

    return null;
  } catch (e) {
    print('Error calculating scenario response: ' + e.toString());
    return 'Error calculating scenario response';
  }
}

Future<DepotsRecord> getNearestDepot(Iterable<mtk.LatLng> polygons) async {
  // get Depot locations
  final depotsRecords = await queryDepotsRecordOnce();
  var closestDepot = depotsRecords.first;

  final polygonCentroid = await getPolygonCentroid(polygons);

  for (var depot in depotsRecords) {
    final distanceToDepot = SphericalUtil.computeDistanceBetween(
        mtk.LatLng(depot.location!.latitude, depot.location!.longitude),
        polygonCentroid);
    final distanceToClosestDepot = SphericalUtil.computeDistanceBetween(
        mtk.LatLng(
            closestDepot.location!.latitude, closestDepot.location!.longitude),
        polygonCentroid);

    if (distanceToDepot < distanceToClosestDepot) {
      closestDepot = depot;
    }
  }
  return closestDepot;
  // get polygon centroid
}

Future<double> calculateResponseCoverage(
    DocumentReference scenarioReference,
    DocumentReference closestDepot,
    List<ResponseItemsRecord> recommendedResponseItems) async {
  final responseItems = await queryResponseItemsRecordOnce();

  final responseItemsInAllDepots = await queryActiveResponseItemsRecordOnce();
  final responseItemsForClosestDepot = responseItemsInAllDepots
      .where((element) => element.homeDepot == closestDepot)
      .toList();
  final numberInAllDepots = responseItemsInAllDepots.length;
  double responseCoverage = 0.0;
  int itemTypesNeeded = 0;

// find total of that response item in closest depot
  for (var responseItem in responseItems) {
    final itemsInClosestDepotCount = responseItemsForClosestDepot
        .where((element) => element.responseItem == responseItem.reference)
        .length;
    final recommendedResponseItemsCount = recommendedResponseItems
        .where((element) => element.reference == responseItem.reference)
        .length;

    if (recommendedResponseItemsCount == 0) {
      continue;
    }
    final itemCoverage =
        itemsInClosestDepotCount / recommendedResponseItemsCount;
    responseCoverage += itemCoverage <= 1 ? itemCoverage : 1;
    itemTypesNeeded += 1;

    await saveScenarioResponseItems(
        recommendedResponseItemsCount,
        itemsInClosestDepotCount,
        numberInAllDepots,
        responseItem,
        scenarioReference);
  }

  return responseCoverage / itemTypesNeeded;
}

Future<void> saveScenarioResponseItems(
    int numberRequired,
    int numberInClosestDepot,
    int numberInAllDepots,
    ResponseItemsRecord responseItem,
    DocumentReference scenarioReference) async {
  final itemCoverage = numberInClosestDepot / numberRequired;
  final createScenarioResponseItemsCreateData =
      createScenarioResponseItemsRecordData(
          numberRequired: numberRequired,
          name: responseItem.name,
          responseItem: responseItem.reference,
          imagePath: responseItem.imageLink,
          numberInClosestDepot: numberInClosestDepot,
          numberInAllDepots: numberInAllDepots,
          coverage: itemCoverage <= 1 ? itemCoverage : 1);

  var scenarioResponseItemsRecordReference =
      ScenarioResponseItemsRecord.createDoc(scenarioReference);
  await scenarioResponseItemsRecordReference
      .set(createScenarioResponseItemsCreateData);
}

deletePreviousResults(DocumentReference scenarioReference) async {
  // delete previous scenario results
  final scenarioResultsRecords =
      await queryScenarioResultsRecordOnce(parent: scenarioReference);
  scenarioResultsRecords.forEach((element) {
    element.reference.delete();
  });

  final scenarioHouseholdResponsesRecords =
      await queryScenarioHouseholdResponsesRecordOnce(
          parent: scenarioReference);
  scenarioHouseholdResponsesRecords.forEach((element) {
    element.reference.delete();
  });

  final scenarioResponseItemsRecords =
      await queryScenarioResponseItemsRecordOnce(parent: scenarioReference);
  scenarioResponseItemsRecords.forEach((element) {
    element.reference.delete();
  });
}

Future<RecommendedResponseItem> calculateResponseItem(
    double requiredBatteryCapacity,
    List<ResponseItemsRecord> responseItemOptions) async {
  RecommendedResponseItem recommendedResponseItem =
      RecommendedResponseItem(null, false);

  // Find the first response item that has enough capacity
  for (var responseItem in responseItemOptions) {
    if (responseItem.totalEnergyStorageCapacity >= requiredBatteryCapacity) {
      recommendedResponseItem.responseItem = responseItem;
      break; // Exit the loop once a suitable response item is found
    }
  }

  // If no response item has enough capacity, return the largest one
  if (recommendedResponseItem.responseItem == null) {
    recommendedResponseItem.responseItem = responseItemOptions.last;
    recommendedResponseItem.needsRecharging = true;
  }

  return recommendedResponseItem;
}

Future<MappedPsrCategory> getPsrCategoryData(PsrRecord psrHousehold,
    List<PsrCategoryOptionsRecord> psrCategoryOptionsRecords) async {
  final psrCategoriesRecords =
      await queryPsrCategoriesRecordOnce(parent: psrHousehold.reference);

  var categoryNames = '';
  double totalPowerConsumption = 0.0;
  double maxResilienceScore = 0.0;
  for (PsrCategoriesRecord category in psrCategoriesRecords) {
    final categoryData = psrCategoryOptionsRecords
        .where((element) => element.reference == category.psrCategory)
        .first;

    if (categoryData != null) {
      if (categoryData.powerConsumption != null) {
        totalPowerConsumption += categoryData.powerConsumption! / 24;
        categoryNames += categoryData.name! + ', ';
      }
      if (categoryData.resilienceScore != null) {
        if (categoryData.resilienceScore! > maxResilienceScore) {
          maxResilienceScore = categoryData.resilienceScore!;
        }
      }
    }
  }
  return MappedPsrCategory(
      categoryNames, totalPowerConsumption, maxResilienceScore);
}

class MappedPsrCategory {
  final String names;
  final double powerConsumption;
  final double maxResilienceScore;
  MappedPsrCategory(this.names, this.powerConsumption, this.maxResilienceScore);
}

class RecommendedResponseItem {
  ResponseItemsRecord? responseItem;
  bool needsRecharging;
  RecommendedResponseItem(this.responseItem, this.needsRecharging);
}

Future<bool> saveScenarioResults(
    DocumentReference scenarioReference,
    int totalPsrHomesImpacted,
    double totalCost,
    double totalResponseItems,
    double responseCoverage,
    DocumentReference nearestDepotReference,
    String nearestDepot) async {
  // save scenario results
  final scenarioResultsCreateData = createScenarioResultsRecordData(
      scenario: scenarioReference,
      psrHouseholdsImpacted: totalPsrHomesImpacted,
      totalCost: totalCost,
      numberOfResponseItems: totalResponseItems,
      responseCoverage: responseCoverage,
      nearestDepot: nearestDepotReference,
      nearestDepotName: nearestDepot);

  var scenarioResultsRecordReference =
      ScenarioResultsRecord.createDoc(scenarioReference);
  await scenarioResultsRecordReference.set(scenarioResultsCreateData);

  return true;
}

bool checkLocationIsInPolygon(
    mtk.LatLng propertyLocation, List<PolygonPointsRecord> polygonRecords) {
  final polygonLatLngs =
      polygonRecords.map((e) => mtk.LatLng(e.latitude!, e.longitude!)).toList();

  final isInPolygon =
      mtk.PolygonUtil.containsLocation(propertyLocation, polygonLatLngs, true);
  return isInPolygon;
}

bool checkLocationIsInCircle(
    mtk.LatLng propertyLocation, List<CirclesRecord> circleRecords) {
  final circleCenters =
      circleRecords.map((e) => mtk.LatLng(e.latitude!, e.longitude!)).toList();
  final circleRadii = circleRecords.map((e) => e.radius);
  final isInPolygon =
      mtk.PolygonUtil.containsLocation(propertyLocation, circleCenters, true);
  return isInPolygon;
}

mtk.LatLng getPolygonCentroid(Iterable<mtk.LatLng> points) {
  double latitude = 0;
  double longitude = 0;
  int n = points.length;

  for (mtk.LatLng point in points) {
    latitude += point.latitude;
    longitude += point.longitude;
  }

  return mtk.LatLng(latitude / n, longitude / n);
}
