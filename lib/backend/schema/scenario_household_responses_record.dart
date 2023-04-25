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

  double? get cost;

  @BuiltValueField(wireName: 'response_item_name')
  String? get responseItemName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(
          ScenarioHouseholdResponsesRecordBuilder builder) =>
      builder
        ..cost = 0.0
        ..responseItemName = '';

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
  double? cost,
  String? responseItemName,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioHouseholdResponsesRecord.serializer,
    ScenarioHouseholdResponsesRecord(
      (s) => s
        ..responseItem = responseItem
        ..cost = cost
        ..responseItemName = responseItemName,
    ),
  );

  return firestoreData;
}
