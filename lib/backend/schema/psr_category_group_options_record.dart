import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PsrCategoryGroupOptionsRecord extends FirestoreRecord {
  PsrCategoryGroupOptionsRecord._(
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
      FirebaseFirestore.instance.collection('psr_category_group_options');

  static Stream<PsrCategoryGroupOptionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PsrCategoryGroupOptionsRecord.fromSnapshot(s));

  static Future<PsrCategoryGroupOptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PsrCategoryGroupOptionsRecord.fromSnapshot(s));

  static PsrCategoryGroupOptionsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PsrCategoryGroupOptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PsrCategoryGroupOptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PsrCategoryGroupOptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PsrCategoryGroupOptionsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPsrCategoryGroupOptionsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}
