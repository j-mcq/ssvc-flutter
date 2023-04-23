import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'circles_record.g.dart';

abstract class CirclesRecord
    implements Built<CirclesRecord, CirclesRecordBuilder> {
  static Serializer<CirclesRecord> get serializer => _$circlesRecordSerializer;

  double? get latitude;

  double? get longitude;

  double? get radius;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CirclesRecordBuilder builder) => builder
    ..latitude = 0.0
    ..longitude = 0.0
    ..radius = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('circles')
          : FirebaseFirestore.instance.collectionGroup('circles');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('circles').doc();

  static Stream<CirclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CirclesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CirclesRecord._();
  factory CirclesRecord([void Function(CirclesRecordBuilder) updates]) =
      _$CirclesRecord;

  static CirclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCirclesRecordData({
  double? latitude,
  double? longitude,
  double? radius,
}) {
  final firestoreData = serializers.toFirestore(
    CirclesRecord.serializer,
    CirclesRecord(
      (c) => c
        ..latitude = latitude
        ..longitude = longitude
        ..radius = radius,
    ),
  );

  return firestoreData;
}
