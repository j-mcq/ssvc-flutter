// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> calculateAllResponseItemsCount() async {
  try {
    final responseItems = await queryResponseItemsRecordOnce();
    int totalResponseItems = 0;
    for (var responseItem in responseItems) {
      totalResponseItems +=
          await calculateTotalStockLevels(responseItem.reference);
    }
    return totalResponseItems;
  } catch (e) {
    print('error calculating total response items: $e ');
    return 0;
  }
}
