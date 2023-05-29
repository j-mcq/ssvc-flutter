import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssvc/backend/backend.dart';
import 'package:ssvc/backend/schema/scenario_record.dart';

Future<Map<String, dynamic>> getTestScenario(DocumentReference user) async {
  return createScenarioRecordData(
      name: 'testScenario1',
      timestamp: DateTime(DateTime.now().day),
      createdBy: user,
      outageDuration: 4,
      mapCenterLocation: LatLng(51.452802, 0.147696),
      mapZoomLevel: 3);
}

Future<DocumentReference> getTestScenarioReference(
    DocumentReference userReference) async {
  final testScenario = await getTestScenario(userReference);
  return await ScenarioRecord.collection.add(testScenario);
}

Future<Map<String, dynamic>> getTestUser() async {
  return createUsersRecordData(email: 'j@j.com', emailVerified: true);
}

Future<DocumentReference> getTestUserReference() async {
  final testUser = await getTestUser();
  return await UsersRecord.collection.add(testUser);
}
