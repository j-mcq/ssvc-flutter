// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:maps_toolkit/maps_toolkit.dart' as mtk;

Future<String?> calculateScenarioResponse(
    DocumentReference? scenarioReference) async {
  // Add your function code here!
  _saveData(scenarioReference);
  return '';
}

bool checkLocationIsInOutagArea() {
  // mtk.LatLng propertyLocationMtk = mtk.LatLng(
  //     _markers.first.position.latitude, _markers.first.position.longitude);

  // propertyLocation = propertyLocationMtk;
  // final polygonLatLngsMtk =
  //     polygonLatLngs.map((e) => mtk.LatLng(e.latitude, e.longitude)).toList();

  // final isInPolygon = mtk.PolygonUtil.containsLocation(
  //     propertyLocation, polygonLatLngsMtk, true);
  // return isInPolygon;

  return true;
}

// bool _calculateScenarioResults(mtk.LatLng? propertyLocation) {
//   // convert to maps_toolkit LatLng

//   mtk.LatLng propertyLocationMtk = mtk.LatLng(
//       _markers.first.position.latitude, _markers.first.position.longitude);

//   propertyLocation = propertyLocationMtk;
//   final polygonLatLngsMtk = polygonLatLngs
//       .map((e) => mtk.LatLng(e.latLng.latitude, e.latLng.longitude))
//       .toList();

//   final isInPolygon = mtk.PolygonUtil.containsLocation(
//       propertyLocation, polygonLatLngsMtk, true);
//   return isInPolygon;
// }

void _saveData(DocumentReference<Object?>? scenarioReference) async {
  FFAppState().isSaving = true;

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
  );
  // name: name);

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
  ;

  FFAppState().isSaving = false;
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
