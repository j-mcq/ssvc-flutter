import 'dart:async';

import 'package:collection/collection.dart';

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _psrCategory = snapshotData['psr_category'] as DocumentReference?;
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

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PsrCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPsrCategoriesRecordData({
  DocumentReference? psrCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'psr_category': psrCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class PsrCategoriesRecordDocumentEquality
    implements Equality<PsrCategoriesRecord> {
  const PsrCategoriesRecordDocumentEquality();

  @override
  bool equals(PsrCategoriesRecord? e1, PsrCategoriesRecord? e2) {
    return e1?.psrCategory == e2?.psrCategory;
  }

  @override
  int hash(PsrCategoriesRecord? e) =>
      const ListEquality().hash([e?.psrCategory]);

  @override
  bool isValidKey(Object? o) => o is PsrCategoriesRecord;
}
