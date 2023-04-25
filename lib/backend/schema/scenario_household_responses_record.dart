import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scenario_household_responses_record.g.dart';

abstract class ScenarioHouseholdResponsesRecord
    implements
        Built<ScenarioHouseholdResponsesRecord,
            ScenarioHouseholdResponsesRecordBuilder> {
  static Serializer<ScenarioHouseholdResponsesRecord> get serializer =>
      _$scenarioHouseholdResponsesRecordSerializer;

  @BuiltValueField(wireName: 'response_item')
  DocumentReference? get responseItem;

  @BuiltValueField(wireName: 'response_item_name')
  int? get responseItemName;

  double? get cost;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(
          ScenarioHouseholdResponsesRecordBuilder builder) =>
      builder
        ..responseItemName = 0
        ..cost = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scenario_household_responses')
          : FirebaseFirestore.instance
              .collectionGroup('scenario_household_responses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scenario_household_responses').doc();

  static Stream<ScenarioHouseholdResponsesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScenarioHouseholdResponsesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScenarioHouseholdResponsesRecord._();
  factory ScenarioHouseholdResponsesRecord(
          [void Function(ScenarioHouseholdResponsesRecordBuilder) updates]) =
      _$ScenarioHouseholdResponsesRecord;

  static ScenarioHouseholdResponsesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScenarioHouseholdResponsesRecordData({
  DocumentReference? responseItem,
  int? responseItemName,
  double? cost,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioHouseholdResponsesRecord.serializer,
    ScenarioHouseholdResponsesRecord(
      (s) => s
        ..responseItem = responseItem
        ..responseItemName = responseItemName
        ..cost = cost,
    ),
  );

  return firestoreData;
}
