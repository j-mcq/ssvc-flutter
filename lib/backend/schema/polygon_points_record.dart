import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'polygon_points_record.g.dart';

abstract class PolygonPointsRecord
    implements Built<PolygonPointsRecord, PolygonPointsRecordBuilder> {
  static Serializer<PolygonPointsRecord> get serializer =>
      _$polygonPointsRecordSerializer;

  double? get latitude;

  double? get longitude;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PolygonPointsRecordBuilder builder) => builder
    ..latitude = 0.0
    ..longitude = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('polygon_points')
          : FirebaseFirestore.instance.collectionGroup('polygon_points');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('polygon_points').doc();

  static Stream<PolygonPointsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PolygonPointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PolygonPointsRecord._();
  factory PolygonPointsRecord(
          [void Function(PolygonPointsRecordBuilder) updates]) =
      _$PolygonPointsRecord;

  static PolygonPointsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPolygonPointsRecordData({
  double? latitude,
  double? longitude,
}) {
  final firestoreData = serializers.toFirestore(
    PolygonPointsRecord.serializer,
    PolygonPointsRecord(
      (p) => p
        ..latitude = latitude
        ..longitude = longitude,
    ),
  );

  return firestoreData;
}
