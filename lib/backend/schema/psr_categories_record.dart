import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PsrCategoriesRecord extends FirestoreRecord {
  PsrCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "psr_category" field.
  DocumentReference? _psrCategory;
  DocumentReference? get psrCategory => _psrCategory;
  bool hasPsrCategory() => _psrCategory != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _psrCategory = snapshotData['psr_category'] as DocumentReference?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('psr_categories')
          : FirebaseFirestore.instance.collectionGroup('psr_categories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('psr_categories').doc();

  static Stream<PsrCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PsrCategoriesRecord.fromSnapshot(s));

  static Future<PsrCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PsrCategoriesRecord.fromSnapshot(s));

  static PsrCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PsrCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PsrCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PsrCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PsrCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPsrCategoriesRecordData({
  DocumentReference? psrCategory,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'psr_category': psrCategory,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}
