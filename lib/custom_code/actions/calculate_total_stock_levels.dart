// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> calculateTotalStockLevels(
    DocumentReference? responseItemReference) async {
  // Add your function code here!

  final stockDepotMappings = await queryStockDepotMappingRecordOnce(
      queryBuilder: (stockDepotMappings) => stockDepotMappings
          .where('response_item', isEqualTo: responseItemReference));

  int totalStockLevel = 0;
  for (var stockDepotMapping in stockDepotMappings) {
    totalStockLevel += stockDepotMapping.numberInStock;
  }
  return totalStockLevel;
}
