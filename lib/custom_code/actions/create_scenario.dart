// Automatic FlutterFlow imports
import '../../auth/firebase_auth/auth_util.dart';
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

Future<DocumentReference?> createScenario() async {
  // Add your function code here!

  // create new scenario

  final adminUsers = await queryUsersRecordOnce(
      queryBuilder: (record) => record.where('isAdmin', isEqualTo: true));

  var scenarioRecordReference = ScenarioRecord.collection.doc();

  await scenarioRecordReference.set({
    ...createScenarioRecordData(createdBy: currentUserReference),
    'owners': adminUsers.toList(),
  });

  return scenarioRecordReference;
}

DocumentReference? get currentUserReference =>
    loggedIn ? UsersRecord.collection.doc(currentUser!.uid) : null;
