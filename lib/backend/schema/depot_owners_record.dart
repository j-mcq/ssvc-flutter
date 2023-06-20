import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepotOwnersRecord extends FirestoreRecord {
  DepotOwnersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('depot_owners');

  static Stream<DepotOwnersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepotOwnersRecord.fromSnapshot(s));

  static Future<DepotOwnersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepotOwnersRecord.fromSnapshot(s));

  static DepotOwnersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DepotOwnersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepotOwnersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepotOwnersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepotOwnersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepotOwnersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepotOwnersRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}
