import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepotsRecord extends FirestoreRecord {
  DepotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  bool hasPostcode() => _postcode != null;

  // "radius_of_influence" field.
  double? _radiusOfInfluence;
  double get radiusOfInfluence => _radiusOfInfluence ?? 0.0;
  bool hasRadiusOfInfluence() => _radiusOfInfluence != null;

  // "location_name" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "owner_name" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  bool hasOwnerName() => _ownerName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _postcode = snapshotData['postcode'] as String?;
    _radiusOfInfluence =
        castToType<double>(snapshotData['radius_of_influence']);
    _locationName = snapshotData['location_name'] as String?;
    _ownerName = snapshotData['owner_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('depots');

  static Stream<DepotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepotsRecord.fromSnapshot(s));

  static Future<DepotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepotsRecord.fromSnapshot(s));

  static DepotsRecord fromSnapshot(DocumentSnapshot snapshot) => DepotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepotsRecordData({
  String? name,
  LatLng? location,
  String? postcode,
  double? radiusOfInfluence,
  String? locationName,
  String? ownerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'postcode': postcode,
      'radius_of_influence': radiusOfInfluence,
      'location_name': locationName,
      'owner_name': ownerName,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepotsRecordDocumentEquality implements Equality<DepotsRecord> {
  const DepotsRecordDocumentEquality();

  @override
  bool equals(DepotsRecord? e1, DepotsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.postcode == e2?.postcode &&
        e1?.radiusOfInfluence == e2?.radiusOfInfluence &&
        e1?.locationName == e2?.locationName &&
        e1?.ownerName == e2?.ownerName;
  }

  @override
  int hash(DepotsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.postcode,
        e?.radiusOfInfluence,
        e?.locationName,
        e?.ownerName
      ]);

  @override
  bool isValidKey(Object? o) => o is DepotsRecord;
}
