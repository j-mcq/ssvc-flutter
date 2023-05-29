// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> buildDepotMappings(
    DocumentReference responseItemReference) async {
  // get depots collection
  try {
    final depots = await queryDepotsRecordOnce();
    final responseItem =
        await ResponseItemsRecord.getDocument(responseItemReference).first;

    for (var depot in depots) {
      final stockDepotMapping = createStockDepotMappingRecordData(
          responseItem: responseItemReference,
          depot: depot.reference,
          depotName: depot.name,
          responseItemName: responseItem.name);
      StockDepotMappingRecord.collection.add(stockDepotMapping);
    }
    return null;
  } catch (e) {
    print('Error creating depot mapings: $e');
    return 'Error creating depot mapings: $e';
  }
}
