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

  @BuiltValueField(wireName: 'households_impacted')
  int? get householdsImpacted;

  @BuiltValueField(wireName: 'psr_households_impacted')
  int? get psrHouseholdsImpacted;

  @BuiltValueField(wireName: 'response_coverage')
  double? get responseCoverage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ScenarioResultsRecordBuilder builder) =>
      builder
        ..numberRequired = 0
        ..responseItemName = ''
        ..householdsImpacted = 0
        ..psrHouseholdsImpacted = 0
        ..responseCoverage = 0.0;

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
  DocumentReference? responseItem,
  int? numberRequired,
  String? responseItemName,
  int? householdsImpacted,
  int? psrHouseholdsImpacted,
  double? responseCoverage,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioResultsRecord.serializer,
    ScenarioResultsRecord(
      (s) => s
        ..scenario = scenario
        ..responseItem = responseItem
        ..numberRequired = numberRequired
        ..responseItemName = responseItemName
        ..householdsImpacted = householdsImpacted
        ..psrHouseholdsImpacted = psrHouseholdsImpacted
        ..responseCoverage = responseCoverage,
    ),
  );

  return firestoreData;
}
