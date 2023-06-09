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

    for (var psrHousehold in impactedPsrHouseholds) {
      final mappedPsrCategory =
          await getPsrCategoryData(psrHousehold, psrCategoryOptionsRecords);

      final householdPowerConsumption =
          mappedPsrCategory.powerConsumption * outageDuration;

      final responseItem =
          await calculateResponseItem(householdPowerConsumption);

      if (responseItem != null) {
        totalCost +=
            responseItem.unitPrice != null ? responseItem.unitPrice! : 0;
        totalResponseItems += 1;

        final createScenarioHouseholdResponsesCreateData =
            createScenarioHouseholdResponsesRecordData(
                cost: responseItem.unitPrice,
                responseItemName: responseItem.name,
                responseItem: responseItem.reference,
                postcode: psrHousehold.postcode,
                psrCategories: mappedPsrCategory.names,
                scenario: scenarioReference,
                powerRequired: householdPowerConsumption,
                highestResilienceScore: mappedPsrCategory.maxResilienceScore);

        var scenarioHouseholdResponsesRecordReference =
            ScenarioHouseholdResponsesRecord.createDoc(scenarioReference);
        await scenarioHouseholdResponsesRecordReference
            .set(createScenarioHouseholdResponsesCreateData);
      }
    }

    final responseCoverage =
        await groupResponseItems(scenarioReference, nearestDepot.reference);
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

Future<double> groupResponseItems(
    DocumentReference scenarioReference, DocumentReference closestDepot) async {
  final responseItemRecords = await queryScenarioHouseholdResponsesRecordOnce(
      parent: scenarioReference);

  final responseItems = await queryResponseItemsRecordOnce();

  final responseItemForClosestDepot = await queryStockDepotMappingRecordOnce(
      queryBuilder: (query) => query.where('depot', isEqualTo: closestDepot));

  double responseCoverage = 0.0;
  double responseItemTypeCount = 0.0;
  for (var responseItemInDepot in responseItemForClosestDepot) {
    final filtedResponseItem = responseItems
        .where(
            (element) => element.reference == responseItemInDepot.responseItem)
        .first;

    double responseCoveragePerItem = 0.0;
    var itemCount = 0;
    for (var responseItemResult in responseItemRecords) {
      if (responseItemResult.responseItem == responseItemInDepot.responseItem) {
        itemCount += 1;
      }
    }
    if (itemCount > 0) {
      responseItemTypeCount += 1;
      final createScenarioResponseItemsCreateData =
          createScenarioResponseItemsRecordData(
              numberRequired: itemCount,
              name: filtedResponseItem.name,
              responseItem: responseItemInDepot.responseItem,
              imagePath: filtedResponseItem.imageLink);

      var scenarioResponseItemsRecordReference =
          ScenarioResponseItemsRecord.createDoc(scenarioReference);
      await scenarioResponseItemsRecordReference
          .set(createScenarioResponseItemsCreateData);
      if (itemCount < responseItemInDepot.numberInStock!) {
        responseCoveragePerItem = 1;
      } else {
        responseCoveragePerItem =
            responseItemInDepot.numberInStock! / itemCount;
      }
    }

    responseCoverage += responseCoveragePerItem;
  }

  double percentageCoverage = 0;
  if (responseItemTypeCount > 0) {
    percentageCoverage = double.parse(
        (responseCoverage / responseItemTypeCount).toStringAsPrecision(2));
  }

  return percentageCoverage;
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

Future<ResponseItemsRecord?> calculateResponseItem(
    double requiredBatteryCapacity) async {
  // get all available respone items
  final responseItems = await queryResponseItemsRecordOnce(
      queryBuilder: (query) => query.orderBy('total_energy_storage_capacity'));

  for (var responseItem in responseItems) {
    if (responseItem.totalEnergyStorageCapacity! >= requiredBatteryCapacity) {
      return responseItem;
    }
  }
  return null;
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
