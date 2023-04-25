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

  @BuiltValueField(wireName: 'psr_households_impacted')
  int? get psrHouseholdsImpacted;

  @BuiltValueField(wireName: 'response_coverage')
  double? get responseCoverage;

  @BuiltValueField(wireName: 'total_cost')
  double? get totalCost;

  @BuiltValueField(wireName: 'number_of_response_items')
  double? get numberOfResponseItems;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ScenarioResultsRecordBuilder builder) =>
      builder
        ..psrHouseholdsImpacted = 0
        ..responseCoverage = 0.0
        ..totalCost = 0.0
        ..numberOfResponseItems = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scenario_results')
          : FirebaseFirestore.instance.collectionGroup('scenario_results');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scenario_results').doc();

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
  int? psrHouseholdsImpacted,
  double? responseCoverage,
  double? totalCost,
  double? numberOfResponseItems,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioResultsRecord.serializer,
    ScenarioResultsRecord(
      (s) => s
        ..scenario = scenario
        ..psrHouseholdsImpacted = psrHouseholdsImpacted
        ..responseCoverage = responseCoverage
        ..totalCost = totalCost
        ..numberOfResponseItems = numberOfResponseItems,
    ),
  );

  return firestoreData;
}
