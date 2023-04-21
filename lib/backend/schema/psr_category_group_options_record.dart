import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'psr_category_group_options_record.g.dart';

abstract class PsrCategoryGroupOptionsRecord
    implements
        Built<PsrCategoryGroupOptionsRecord,
            PsrCategoryGroupOptionsRecordBuilder> {
  static Serializer<PsrCategoryGroupOptionsRecord> get serializer =>
      _$psrCategoryGroupOptionsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          PsrCategoryGroupOptionsRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psr_category_group_options');

  static Stream<PsrCategoryGroupOptionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PsrCategoryGroupOptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PsrCategoryGroupOptionsRecord._();
  factory PsrCategoryGroupOptionsRecord(
          [void Function(PsrCategoryGroupOptionsRecordBuilder) updates]) =
      _$PsrCategoryGroupOptionsRecord;

  static PsrCategoryGroupOptionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPsrCategoryGroupOptionsRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    PsrCategoryGroupOptionsRecord.serializer,
    PsrCategoryGroupOptionsRecord(
      (p) => p..name = name,
    ),
  );

  return firestoreData;
}
