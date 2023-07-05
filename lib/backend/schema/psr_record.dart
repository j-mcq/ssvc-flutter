import 'dart:async';

import 'package:collection/collection.dart';

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
  List<DocumentReference>? _owner;
  List<DocumentReference> get owner => _owner ?? const [];
  bool hasOwner() => _owner != null;

  // "oner" field.
  DocumentReference? _oner;
  DocumentReference? get oner => _oner;
  bool hasOner() => _oner != null;

  void _initializeFields() {
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _postcode = snapshotData['postcode'] as String?;
    _longitude = castToType<double>(snapshotData['longitude']);
    _latitude = castToType<double>(snapshotData['latitude']);
    _owner = getDataList(snapshotData['owner']);
    _oner = snapshotData['oner'] as DocumentReference?;
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
  DocumentReference? oner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address1': address1,
      'address2': address2,
      'postcode': postcode,
      'longitude': longitude,
      'latitude': latitude,
      'oner': oner,
    }.withoutNulls,
  );

  return firestoreData;
}

class PsrRecordDocumentEquality implements Equality<PsrRecord> {
  const PsrRecordDocumentEquality();

  @override
  bool equals(PsrRecord? e1, PsrRecord? e2) {
    const listEquality = ListEquality();
    return e1?.address1 == e2?.address1 &&
        e1?.address2 == e2?.address2 &&
        e1?.postcode == e2?.postcode &&
        e1?.longitude == e2?.longitude &&
        e1?.latitude == e2?.latitude &&
        listEquality.equals(e1?.owner, e2?.owner) &&
        e1?.oner == e2?.oner;
  }

  @override
  int hash(PsrRecord? e) => const ListEquality().hash([
        e?.address1,
        e?.address2,
        e?.postcode,
        e?.longitude,
        e?.latitude,
        e?.owner,
        e?.oner
      ]);

  @override
  bool isValidKey(Object? o) => o is PsrRecord;
}
