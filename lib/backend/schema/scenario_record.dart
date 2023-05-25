import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScenarioRecord extends FirestoreRecord {
  ScenarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "outage_duration" field.
  double? _outageDuration;
  double get outageDuration => _outageDuration ?? 0.0;
  bool hasOutageDuration() => _outageDuration != null;

  // "map_center_location" field.
  LatLng? _mapCenterLocation;
  LatLng? get mapCenterLocation => _mapCenterLocation;
  bool hasMapCenterLocation() => _mapCenterLocation != null;

  // "map_zoom_level" field.
  double? _mapZoomLevel;
  double get mapZoomLevel => _mapZoomLevel ?? 0.0;
  bool hasMapZoomLevel() => _mapZoomLevel != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _outageDuration = castToType<double>(snapshotData['outage_duration']);
    _mapCenterLocation = snapshotData['map_center_location'] as LatLng?;
    _mapZoomLevel = castToType<double>(snapshotData['map_zoom_level']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scenario');

  static Stream<ScenarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScenarioRecord.fromSnapshot(s));

  static Future<ScenarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScenarioRecord.fromSnapshot(s));

  static ScenarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScenarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScenarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScenarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScenarioRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createScenarioRecordData({
  String? name,
  DateTime? timestamp,
  DocumentReference? createdBy,
  double? outageDuration,
  LatLng? mapCenterLocation,
  double? mapZoomLevel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'timestamp': timestamp,
      'created_by': createdBy,
      'outage_duration': outageDuration,
      'map_center_location': mapCenterLocation,
      'map_zoom_level': mapZoomLevel,
    }.withoutNulls,
  );

  return firestoreData;
}
