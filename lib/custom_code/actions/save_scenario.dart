// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> saveScenario(
  DocumentReference? scenarioReference,
  double? scenarioDuration,
  String scenarioName,
) async {
  try {
    return await saveData(scenarioReference, scenarioName, scenarioDuration);
  } catch (e) {
    print('Error saving Scenario: ' + e.toString());
    return null;
  }
}

Future<DocumentReference> saveData(DocumentReference? scenarioReference,
    String scenarioName, double? scenarioDuration) async {
  // create a new sceario is none exists
  if (scenarioReference == null) {
    final scenarioCreateData = createScenarioRecordData();
    var scenarioRecordReference = ScenarioRecord.collection.doc();
    await scenarioRecordReference.set(scenarioCreateData);
    scenarioReference = ScenarioRecord.getDocumentFromData(
            scenarioCreateData, scenarioRecordReference)
        .reference;
  }

  final updatedScenarioData = createScenarioRecordData(
      mapCenterLocation: FFAppState().mapCenterLocation,
      mapZoomLevel: FFAppState().mapZoomLevel,
      name: scenarioName,
      outageDuration: scenarioDuration);

  await scenarioReference.update(updatedScenarioData);

  // remove all previous polygons and circles associated with this scenario before saving the new ones
  await deletePolygons(scenarioReference);
  // add newly created polygons and circles to the database
  if (FFAppState().polygonLatLngList.isNotEmpty) {
    FFAppState().polygonLatLngList.asMap().forEach((index, element) async {
      final polygonPointsRecordData = createPolygonPointsRecordData(
          latitude: element.latitude,
          longitude: element.longitude,
          index: index);
      await PolygonPointsRecord.createDoc(scenarioReference!)
          .set(polygonPointsRecordData);
    });
  }

  await deleteCircles(scenarioReference);

  if (FFAppState().circleLatLng != null) {
    final circleRecordData = createCirclesRecordData(
      latitude: FFAppState().circleLatLng!.latitude,
      longitude: FFAppState().circleLatLng!.longitude,
      radius: FFAppState().circleRadius,
    );
    await CirclesRecord.createDoc(scenarioReference).set(circleRecordData);
  }

  return scenarioReference;
}

Future<void> deletePolygons(
    DocumentReference<Object?> scenarioReference) async {
  final polygonPoints =
      await queryPolygonPointsRecordOnce(parent: scenarioReference);

  for (var polygonPoint in polygonPoints) {
    await polygonPoint.reference.delete();
  }
}

Future<void> deleteCircles(DocumentReference<Object?> scenarioReference) async {
  final circles = await queryCirclesRecordOnce(parent: scenarioReference);

  for (var circle in circles) {
    await circle.reference.delete();
  }
}
