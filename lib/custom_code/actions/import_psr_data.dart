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
import 'package:fast_csv/fast_csv.dart' as _fast_csv;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:collection/collection.dart';

Future<bool> importPsrData(String filePath) async {
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
      print('Error importing PSR data: no rows found');
      return false;
    }

    final psrOptions = await queryPsrCategoryOptionsRecordOnce();

    for (var row in rows.getRange(1, rows.length).toList()) {
      final psrCategoriesForHousehold = getPsrCategories(row, psrOptions);

      final psrCreateData = createPsrRecordData(
          latitude: double.parse(row[11]),
          longitude: double.parse(row[12]),
          postcode: row[10]);

      var psrRecordReference = PsrRecord.collection.doc();
      await psrRecordReference.set(psrCreateData);

      final psrCategoriesReference = PsrCategoriesRecord.getDocumentFromData(
              psrCreateData, psrRecordReference)
          .reference;

      for (var psrCategory in psrCategoriesForHousehold) {
        final psrCategoriesCreateData =
            createPsrCategoriesRecordData(psrCategory: psrCategory.reference);

        var psrCategoriesRecordReference =
            PsrCategoriesRecord.createDoc(psrCategoriesReference);

        await psrCategoriesRecordReference.set(psrCategoriesCreateData);
      }
    }
  } on FirebaseException catch (e) {
    print('Error importing PSR data: $e');
  }

  return true;
}

List<PsrCategoryOptionsRecord> getPsrCategories(
    row, List<PsrCategoryOptionsRecord> psrOptions) {
  List<PsrCategoryOptionsRecord> psrCategories = [];

  for (var psrCategoryColumn in row.getRange(1, 9).toList()) {
    if (psrCategoryColumn != '') {
      final psrCategory = parsePsrCategory(psrCategoryColumn, psrOptions);

      if (psrCategory != null) {
        psrCategories.add(psrCategory);
      }
    }
  }
  return psrCategories;
}

PsrCategoryOptionsRecord? parsePsrCategory(
    psrCategoryColumn, List<PsrCategoryOptionsRecord> psrOptions) {
  final psrCategory = psrOptions
      .firstWhereOrNull((element) => psrCategoryColumn.contains(element.name));
  return psrCategory;
}
