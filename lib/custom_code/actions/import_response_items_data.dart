// Automatic FlutterFlow imports

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:fast_csv/fast_csv.dart' as _fast_csv;
import 'package:firebase_storage/firebase_storage.dart';

Future importResponseItemsData(String filePath) async {
  // Add your function code here!

  final storageRef = FirebaseStorage.instance.ref();

  final fileReference = storageRef.child(filePath);

// Note that in the URL, characters are URL escaped!

  try {
    const oneMegabyte = 1024 * 1024;
    final Uint8List? inputAsUint8List =
        await fileReference.getData(oneMegabyte);

    String dataString = new String.fromCharCodes(inputAsUint8List!);

    // var dataString = new Uint8List.fromList(s.codeUnits);

    final rows = _fast_csv.parse(dataString);

    if (rows.length <= 1) {
      print('Error importing Response Item data: no rows found');
      return false;
    }

    final responseItemOptions = await queryResponseItemsRecordOnce();
    final depotOptions = await queryDepotsRecordOnce();

    for (var row in rows.getRange(1, rows.length).toList()) {
      final responseItem = parseResponseItems(row[0], responseItemOptions);
      if (responseItem == null) {
        print(
            'Error importing Response Item data: no response item found with name ${row[0]}');
        return false;
      }

      final homeDepot = parseDepots(row[1], depotOptions);
      if (homeDepot == null) {
        print(
            'Error importing Response Item data: no depot found with name: ${row[1]}');
        return false;
      }

      final activeResponseItemCreateData = createActiveResponseItemsRecordData(
        location: LatLng(double.parse(row[3]), double.parse(row[4])),
        responseItem: responseItem!.reference,
        responseItemName: responseItem.name,
        homeDepot: homeDepot!.reference,
        homeDepotName: homeDepot.name,
        statusDescription: row[2],
        imageLink: responseItem.imageLink,
        chargingStatus: double.parse(row[5]),
        isAvailable: row[6] == 'TRUE' ? true : false,
      );

      var responseRecordReference = ActiveResponseItemsRecord.collection.doc();
      await responseRecordReference.set(activeResponseItemCreateData);
    }
  } on FirebaseException catch (e) {
    print('Error importing PSR data: $e');
  }

  return true;
}

ResponseItemsRecord? parseResponseItems(
    value, List<ResponseItemsRecord> responseItems) {
  final responseItem =
      responseItems.firstWhere((element) => value.contains(element.name));
  return responseItem;
}

DepotsRecord? parseDepots(value, List<DepotsRecord> depots) {
  final depot = depots.firstWhere((element) => value.contains(element.name));
  return depot;
}
