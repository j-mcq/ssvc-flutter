import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'psr_record.g.dart';

abstract class PsrRecord implements Built<PsrRecord, PsrRecordBuilder> {
  static Serializer<PsrRecord> get serializer => _$psrRecordSerializer;

  double? get latitude;

  double? get longitude;

  String? get address1;

  String? get address2;

  String? get postcode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PsrRecordBuilder builder) => builder
    ..latitude = 0.0
    ..longitude = 0.0
    ..address1 = ''
    ..address2 = ''
    ..postcode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psr');

  static Stream<PsrRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PsrRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PsrRecord._();
  factory PsrRecord([void Function(PsrRecordBuilder) updates]) = _$PsrRecord;

  static PsrRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPsrRecordData({
  double? latitude,
  double? longitude,
  String? address1,
  String? address2,
  String? postcode,
}) {
  final firestoreData = serializers.toFirestore(
    PsrRecord.serializer,
    PsrRecord(
      (p) => p
        ..latitude = latitude
        ..longitude = longitude
        ..address1 = address1
        ..address2 = address2
        ..postcode = postcode,
    ),
  );

  return firestoreData;
}
