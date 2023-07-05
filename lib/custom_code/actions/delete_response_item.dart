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

Future<String?> deleteResponseItem(
    DocumentReference? responseItemReference) async {
  // Add your function code here!

  final activeResponseItemRecords = await queryActiveResponseItemsRecordOnce(
      queryBuilder: (record) =>
          record.where('response_item', isEqualTo: responseItemReference));

  final scenarioHouseholdResponsesRecords =
      await queryScenarioHouseholdResponsesRecordOnce(
          queryBuilder: (record) =>
              record.where('response_item', isEqualTo: responseItemReference));

  final scenarioResponseItemRecords =
      await queryScenarioResponseItemsRecordOnce(
          queryBuilder: (record) =>
              record.where('response_item', isEqualTo: responseItemReference));

  if (scenarioHouseholdResponsesRecords.length > 0 ||
      scenarioResponseItemRecords.length > 0) {
    return 'You cannot delete this Response Item as it is being used in one or more scenarios. Please delete the scenario(s) first.';
  }
  if (activeResponseItemRecords.length > 0) {
    return 'You cannot delete this Response Item as it is being used by one or more active response item. Please delete the active response item first.';
  }

  responseItemReference?.delete();

  return null;
}
