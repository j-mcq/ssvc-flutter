import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'psr_groups_record.g.dart';

abstract class PsrGroupsRecord
    implements Built<PsrGroupsRecord, PsrGroupsRecordBuilder> {
  static Serializer<PsrGroupsRecord> get serializer =>
      _$psrGroupsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PsrGroupsRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psr_groups');

  static Stream<PsrGroupsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PsrGroupsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PsrGroupsRecord._();
  factory PsrGroupsRecord([void Function(PsrGroupsRecordBuilder) updates]) =
      _$PsrGroupsRecord;

  static PsrGroupsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPsrGroupsRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    PsrGroupsRecord.serializer,
    PsrGroupsRecord(
      (p) => p..name = name,
    ),
  );

  return firestoreData;
}
