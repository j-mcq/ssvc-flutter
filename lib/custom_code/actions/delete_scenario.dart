// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> deleteScenario(DocumentReference scenarioReference) async {
  try {
    final scenarioResults =
        await queryScenarioResultsRecordOnce(parent: scenarioReference);
    final scenaroResponseItems =
        await queryScenarioResponseItemsRecordOnce(parent: scenarioReference);
    final scenarioHouseholdResponses =
        await queryScenarioHouseholdResponsesRecordOnce(
            parent: scenarioReference);
    final polygonPoints =
        await queryPolygonPointsRecordOnce(parent: scenarioReference);
    final circles = await queryCirclesRecordOnce(parent: scenarioReference);

    for (final scenarioResult in scenarioResults) {
      await scenarioResult.reference.delete();
    }
    for (final scenarioResponseItem in scenaroResponseItems) {
      await scenarioResponseItem.reference.delete();
    }
    for (final scenarioHouseholdResponse in scenarioHouseholdResponses) {
      await scenarioHouseholdResponse.reference.delete();
    }
    for (final polygonPoint in polygonPoints) {
      await polygonPoint.reference.delete();
    }
    for (final circle in circles) {
      await circle.reference.delete();
    }

    await scenarioReference.delete();
  } catch (e) {
    print('error deleting scenario: $e ');
    return 'error deleting scenario: $e';
  }
  return null;
}
