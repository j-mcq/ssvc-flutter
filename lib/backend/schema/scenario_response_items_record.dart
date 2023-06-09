import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScenarioResponseItemsRecord extends FirestoreRecord {
  ScenarioResponseItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "response_item" field.
  DocumentReference? _responseItem;
  DocumentReference? get responseItem => _responseItem;
  bool hasResponseItem() => _responseItem != null;

  // "number_required" field.
  int? _numberRequired;
  int get numberRequired => _numberRequired ?? 0;
  bool hasNumberRequired() => _numberRequired != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _responseItem = snapshotData['response_item'] as DocumentReference?;
    _numberRequired = snapshotData['number_required'] as int?;
    _imagePath = snapshotData['image_path'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scenario_response_items')
          : FirebaseFirestore.instance
              .collectionGroup('scenario_response_items');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scenario_response_items').doc();

  static Stream<ScenarioResponseItemsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ScenarioResponseItemsRecord.fromSnapshot(s));

  static Future<ScenarioResponseItemsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ScenarioResponseItemsRecord.fromSnapshot(s));

  static ScenarioResponseItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScenarioResponseItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScenarioResponseItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScenarioResponseItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScenarioResponseItemsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createScenarioResponseItemsRecordData({
  String? name,
  DocumentReference? responseItem,
  int? numberRequired,
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'response_item': responseItem,
      'number_required': numberRequired,
      'image_path': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}
