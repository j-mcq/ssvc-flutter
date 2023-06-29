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

Future<String?> deleteDepotMappings(
    DocumentReference? responseItemReference) async {
  // Add your function code here!
  try {
    final stockDepotMappings = await queryStockDepotMappingRecordOnce(
        queryBuilder: (stockDepotMappings) => stockDepotMappings
            .where('response_item', isEqualTo: responseItemReference));

    for (var stockDepotMapping in stockDepotMappings) {
      await stockDepotMapping.reference.delete();
    }

    // then delete the response item
    await responseItemReference!.delete();

    return null;
  } catch (e) {
    print('Error deleting depot mapings: $e');
    return 'Error deleting depot mapings: $e';
  }
}
