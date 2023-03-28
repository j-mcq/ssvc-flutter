import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scenario_results_record.g.dart';

abstract class ScenarioResultsRecord
    implements Built<ScenarioResultsRecord, ScenarioResultsRecordBuilder> {
  static Serializer<ScenarioResultsRecord> get serializer =>
      _$scenarioResultsRecordSerializer;

  DocumentReference? get scenario;

  @BuiltValueField(wireName: 'response_item')
  DocumentReference? get responseItem;

  @BuiltValueField(wireName: 'number_required')
  int? get numberRequired;

  @BuiltValueField(wireName: 'response_item_name')
  String? get responseItemName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ScenarioResultsRecordBuilder builder) =>
      builder
        ..numberRequired = 0
        ..responseItemName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scenario_results');

  static Stream<ScenarioResultsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScenarioResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScenarioResultsRecord._();
  factory ScenarioResultsRecord(
          [void Function(ScenarioResultsRecordBuilder) updates]) =
      _$ScenarioResultsRecord;

  static ScenarioResultsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScenarioResultsRecordData({
  DocumentReference? scenario,
  DocumentReference? responseItem,
  int? numberRequired,
  String? responseItemName,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioResultsRecord.serializer,
    ScenarioResultsRecord(
      (s) => s
        ..scenario = scenario
        ..responseItem = responseItem
        ..numberRequired = numberRequired
        ..responseItemName = responseItemName,
    ),
  );

  return firestoreData;
}
