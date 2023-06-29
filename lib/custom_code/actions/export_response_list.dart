// Automatic FlutterFlow imports
import 'dart:convert';

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
import 'package:file_saver/file_saver.dart';
import 'package:csv/csv.dart';

Future<String?> exportResponseList(DocumentReference? scenarioReference) async {
  // get all response items for the scenario

  final scenarioHouseholdResponses =
      await queryScenarioHouseholdResponsesRecordOnce(
          parent: scenarioReference);

  if (scenarioHouseholdResponses.isEmpty) {
    return 'No response items found for this scenario';
  }

  List<List<dynamic>> scenarioResponseList = [];
  // Add headders
  scenarioResponseList.add([
    'Postcode',
    'PSR Categories',
    'Power Required',
    'Response Item Name',
    'Priority',
    'Will Need Recharging',
    'Depot'
  ]);
  // Add data
  for (var scenarioResponses in scenarioHouseholdResponses) {
    List<dynamic> scenarioHouseholdResponseList = [];
    scenarioHouseholdResponseList.add(scenarioResponses.postcode);
    scenarioHouseholdResponseList.add(scenarioResponses.psrCategories);
    scenarioHouseholdResponseList.add(scenarioResponses.powerRequired);
    scenarioHouseholdResponseList.add(scenarioResponses.responseItemName);
    scenarioHouseholdResponseList.add(scenarioResponses.highestResilienceScore);
    scenarioHouseholdResponseList.add(scenarioResponses.needsRecharging);
    scenarioHouseholdResponseList.add(scenarioResponses.closestDepotName);
    scenarioResponseList.add(scenarioHouseholdResponseList);
  }

  await exportToCsv(scenarioResponseList);
  return null;
}

Future<void> exportToCsv(List<List<dynamic>> data) async {
  final csvData = ListToCsvConverter().convert(data);

  var exported = const Utf8Encoder().convert(csvData);

  await FileSaver.instance.saveFile(
      name: 'response_list' + DateTime.now().toString() + '.csv',
      bytes: exported,
      ext: '.csv');
}
