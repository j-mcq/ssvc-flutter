// Automatic FlutterFlow imports
import 'dart:convert';

import '/backend/backend.dart';
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

Future<String?> exportPsrCategories() async {
  // get all response items for the scenario

  final psrCategoryOptions = await queryPsrCategoryOptionsRecordOnce();

  List<List<dynamic>> rows = [];
  // Add headders
  rows.add([
    'Category',
    'Resiliance Score',
    'Power Required (kWh)',
    'Electrically Dependant?',
  ]);
  // Add data
  for (var record in psrCategoryOptions) {
    List<dynamic> resultsList = [];
    resultsList.add(record.name);
    resultsList.add(record.resilienceScore);
    resultsList.add(record.powerConsumption);
    resultsList.add(record.electricallyDependant);
    rows.add(resultsList);
  }

  await exportToCsv(rows);
  return null;
}

Future<void> exportToCsv(List<List<dynamic>> data) async {
  final csvData = ListToCsvConverter().convert(data);

  var exported = const Utf8Encoder().convert(csvData);

  await FileSaver.instance.saveFile(
      name: 'psr_categories_' + DateTime.now().toString() + '.csv',
      bytes: exported,
      ext: '.csv');
}
