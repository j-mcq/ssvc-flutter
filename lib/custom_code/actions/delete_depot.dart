// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> deleteDepot(DocumentReference? depotReference) async {
  // check if referenced depot is being used elsewhere
  final scenarioResultsRecord = await queryScenarioResultsRecordOnce(
      queryBuilder: (record) =>
          record.where('nearest_depot', isEqualTo: depotReference));
  final activeResponseItemRecords = await queryActiveResponseItemsRecordOnce(
      queryBuilder: (record) =>
          record.where('home_depot', isEqualTo: depotReference));
  final scenarioHouseholdResponsesRecord =
      await queryScenarioHouseholdResponsesRecordOnce(
          queryBuilder: (record) =>
              record.where('closest_depot', isEqualTo: depotReference));

  if (scenarioResultsRecord.length > 0 ||
      scenarioHouseholdResponsesRecord.length > 0) {
    return 'You cannot delete this Depot as it is being used in one or more scenarios. Please delete the scenario(s) first.';
  }
  if (activeResponseItemRecords.length > 0) {
    return 'You cannot delete this Depot as it is being used by one or more response item. Please delete the response item or change its home depot first.';
  }

  depotReference?.delete();

  return null;
}
