import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CirclesRecord extends FirestoreRecord {
  CirclesRecord._(
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

  // "radius" field.
  double? _radius;
  double get radius => _radius ?? 0.0;
  bool hasRadius() => _radius != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _radius = castToType<double>(snapshotData['radius']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('circles')
          : FirebaseFirestore.instance.collectionGroup('circles');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('circles').doc();

  static Stream<CirclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CirclesRecord.fromSnapshot(s));

  static Future<CirclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CirclesRecord.fromSnapshot(s));

  static CirclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CirclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CirclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CirclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CirclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CirclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCirclesRecordData({
  double? latitude,
  double? longitude,
  double? radius,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'radius': radius,
    }.withoutNulls,
  );

  return firestoreData;
}
