import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PsrRecord extends FirestoreRecord {
  PsrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  bool hasPostcode() => _postcode != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _postcode = snapshotData['postcode'] as String?;
    _longitude = castToType<double>(snapshotData['longitude']);
    _latitude = castToType<double>(snapshotData['latitude']);
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psr');

  static Stream<PsrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PsrRecord.fromSnapshot(s));

  static Future<PsrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PsrRecord.fromSnapshot(s));

  static PsrRecord fromSnapshot(DocumentSnapshot snapshot) => PsrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PsrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PsrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PsrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PsrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPsrRecordData({
  String? address1,
  String? address2,
  String? postcode,
  double? longitude,
  double? latitude,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address1': address1,
      'address2': address2,
      'postcode': postcode,
      'longitude': longitude,
      'latitude': latitude,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}
