import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'response_items_record.g.dart';

abstract class ResponseItemsRecord
    implements Built<ResponseItemsRecord, ResponseItemsRecordBuilder> {
  static Serializer<ResponseItemsRecord> get serializer =>
      _$responseItemsRecordSerializer;

  String? get name;

  String? get description;

  @BuiltValueField(wireName: 'date_added')
  DateTime? get dateAdded;

  @BuiltValueField(wireName: 'image_link')
  String? get imageLink;

  @BuiltValueField(wireName: 'unit_price')
  double? get unitPrice;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ResponseItemsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..imageLink = ''
    ..unitPrice = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('response_items');

  static Stream<ResponseItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ResponseItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ResponseItemsRecord._();
  factory ResponseItemsRecord(
          [void Function(ResponseItemsRecordBuilder) updates]) =
      _$ResponseItemsRecord;

  static ResponseItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createResponseItemsRecordData({
  String? name,
  String? description,
  DateTime? dateAdded,
  String? imageLink,
  double? unitPrice,
}) {
  final firestoreData = serializers.toFirestore(
    ResponseItemsRecord.serializer,
    ResponseItemsRecord(
      (r) => r
        ..name = name
        ..description = description
        ..dateAdded = dateAdded
        ..imageLink = imageLink
        ..unitPrice = unitPrice,
    ),
  );

  return firestoreData;
}
