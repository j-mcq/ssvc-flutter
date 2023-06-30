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

Future<bool> deleteAllActiveResponseItems() async {
  // Add your function code here!
  try {
    final activeResponseItems = await queryActiveResponseItemsRecordOnce();

    // delete all records
    for (var activeResponseItem in activeResponseItems) {
      await activeResponseItem.reference.delete();
    }
    return true;
  } catch (e) {
    print('Error deleting all PSR Customers: ' + e.toString());
    return false;
  }
}
