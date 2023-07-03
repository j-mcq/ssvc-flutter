import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future getActiveResponseItemReferences(BuildContext context) async {}

Future checkIfEditing(
  BuildContext context, {
  String? page,
}) async {
  if (FFAppState().isEditing == true) {
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('You have unsaved edits'),
              content: Text(
                  'Are you sure you want to navigate away without saving your changes?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        ) ??
        false;
    if (confirmDialogResponse) {
      context.pushNamed('dashboard');

      FFAppState().isEditing = false;
    }
  } else {
    context.pushNamed('dashboard');

    FFAppState().isEditing = false;
  }
}
