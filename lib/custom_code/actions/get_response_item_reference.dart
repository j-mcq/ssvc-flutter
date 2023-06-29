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

Future<DocumentReference?> getResponseItemReference(
    String responseItemReferenceId) async {
  // Add your function code here!
  final responseItems = await queryResponseItemsRecordOnce();

  final responseItem = responseItems
      .where((element) => element.reference.id == responseItemReferenceId)
      .toList();

  if (responseItem.length > 0) {
    return responseItem.first.reference;
  }
  return null;
}
