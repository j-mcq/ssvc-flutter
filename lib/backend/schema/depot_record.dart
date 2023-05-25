import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepotRecord extends FirestoreRecord {
  DepotRecord._(
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
      FirebaseFirestore.instance.collection('depot');

  static Stream<DepotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepotRecord.fromSnapshot(s));

  static Future<DepotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepotRecord.fromSnapshot(s));

  static DepotRecord fromSnapshot(DocumentSnapshot snapshot) => DepotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepotRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDepotRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}
