import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PolygonPointsRecord extends FirestoreRecord {
  PolygonPointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _index = snapshotData['index'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('polygon_points')
          : FirebaseFirestore.instance.collectionGroup('polygon_points');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('polygon_points').doc();

  static Stream<PolygonPointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PolygonPointsRecord.fromSnapshot(s));

  static Future<PolygonPointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PolygonPointsRecord.fromSnapshot(s));

  static PolygonPointsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PolygonPointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PolygonPointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PolygonPointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PolygonPointsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPolygonPointsRecordData({
  double? latitude,
  double? longitude,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}
