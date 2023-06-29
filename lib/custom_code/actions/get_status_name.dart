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

Future<String?> getStatusName(String statusReferenceId) async {
  final statuses = await queryResponseItemStatusOptionsRecordOnce();

  final status = statuses
      .where((element) => element.reference.id == statusReferenceId)
      .toList();

  if (status.length > 0) {
    return status.first.name;
  }
  return null;
}
