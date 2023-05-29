import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseItemStatusOptionsRecord extends FirestoreRecord {
  ResponseItemStatusOptionsRecord._(
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
      FirebaseFirestore.instance.collection('response_item_status_options');

  static Stream<ResponseItemStatusOptionsRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ResponseItemStatusOptionsRecord.fromSnapshot(s));

  static Future<ResponseItemStatusOptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ResponseItemStatusOptionsRecord.fromSnapshot(s));

  static ResponseItemStatusOptionsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ResponseItemStatusOptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponseItemStatusOptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponseItemStatusOptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponseItemStatusOptionsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createResponseItemStatusOptionsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}
