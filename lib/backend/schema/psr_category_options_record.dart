import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'psr_category_options_record.g.dart';

abstract class PsrCategoryOptionsRecord
    implements
        Built<PsrCategoryOptionsRecord, PsrCategoryOptionsRecordBuilder> {
  static Serializer<PsrCategoryOptionsRecord> get serializer =>
      _$psrCategoryOptionsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'psr_group')
  DocumentReference? get psrGroup;

  @BuiltValueField(wireName: 'resilience_score')
  double? get resilienceScore;

  @BuiltValueField(wireName: 'power_consumption')
  double? get powerConsumption;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PsrCategoryOptionsRecordBuilder builder) =>
      builder
        ..name = ''
        ..resilienceScore = 0.0
        ..powerConsumption = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psr_category_options');

  static Stream<PsrCategoryOptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PsrCategoryOptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PsrCategoryOptionsRecord._();
  factory PsrCategoryOptionsRecord(
          [void Function(PsrCategoryOptionsRecordBuilder) updates]) =
      _$PsrCategoryOptionsRecord;

  static PsrCategoryOptionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPsrCategoryOptionsRecordData({
  String? name,
  DocumentReference? psrGroup,
  double? resilienceScore,
  double? powerConsumption,
}) {
  final firestoreData = serializers.toFirestore(
    PsrCategoryOptionsRecord.serializer,
    PsrCategoryOptionsRecord(
      (p) => p
        ..name = name
        ..psrGroup = psrGroup
        ..resilienceScore = resilienceScore
        ..powerConsumption = powerConsumption,
    ),
  );

  return firestoreData;
}
