import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'psr_record.g.dart';

abstract class PsrRecord implements Built<PsrRecord, PsrRecordBuilder> {
  static Serializer<PsrRecord> get serializer => _$psrRecordSerializer;

  String? get address1;

  String? get address2;

  String? get postcode;

  double? get longitude;

  double? get latitude;

  DocumentReference? get owner;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PsrRecordBuilder builder) => builder
    ..address1 = ''
    ..address2 = ''
    ..postcode = ''
    ..longitude = 0.0
    ..latitude = 0.0;

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
  String? address1,
  String? address2,
  String? postcode,
  double? longitude,
  double? latitude,
  DocumentReference? owner,
}) {
  final firestoreData = serializers.toFirestore(
    PsrRecord.serializer,
    PsrRecord(
      (p) => p
        ..address1 = address1
        ..address2 = address2
        ..postcode = postcode
        ..longitude = longitude
        ..latitude = latitude
        ..owner = owner,
    ),
  );

  return firestoreData;
}
