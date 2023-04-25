import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scenario_response_items_record.g.dart';

abstract class ScenarioResponseItemsRecord
    implements
        Built<ScenarioResponseItemsRecord, ScenarioResponseItemsRecordBuilder> {
  static Serializer<ScenarioResponseItemsRecord> get serializer =>
      _$scenarioResponseItemsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'response_item')
  DocumentReference? get responseItem;

  @BuiltValueField(wireName: 'number_required')
  int? get numberRequired;

  @BuiltValueField(wireName: 'image_path')
  String? get imagePath;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ScenarioResponseItemsRecordBuilder builder) =>
      builder
        ..name = ''
        ..numberRequired = 0
        ..imagePath = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scenario_response_items')
          : FirebaseFirestore.instance
              .collectionGroup('scenario_response_items');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scenario_response_items').doc();

  static Stream<ScenarioResponseItemsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScenarioResponseItemsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScenarioResponseItemsRecord._();
  factory ScenarioResponseItemsRecord(
          [void Function(ScenarioResponseItemsRecordBuilder) updates]) =
      _$ScenarioResponseItemsRecord;

  static ScenarioResponseItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScenarioResponseItemsRecordData({
  String? name,
  DocumentReference? responseItem,
  int? numberRequired,
  String? imagePath,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioResponseItemsRecord.serializer,
    ScenarioResponseItemsRecord(
      (s) => s
        ..name = name
        ..responseItem = responseItem
        ..numberRequired = numberRequired
        ..imagePath = imagePath,
    ),
  );

  return firestoreData;
}
