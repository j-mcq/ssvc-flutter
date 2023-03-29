import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scenario_results_customers_record.g.dart';

abstract class ScenarioResultsCustomersRecord
    implements
        Built<ScenarioResultsCustomersRecord,
            ScenarioResultsCustomersRecordBuilder> {
  static Serializer<ScenarioResultsCustomersRecord> get serializer =>
      _$scenarioResultsCustomersRecordSerializer;

  DocumentReference? get scenario;

  @BuiltValueField(wireName: 'psr_group_name')
  String? get psrGroupName;

  @BuiltValueField(wireName: 'psr_group')
  DocumentReference? get psrGroup;

  @BuiltValueField(wireName: 'number_impacted')
  int? get numberImpacted;

  @BuiltValueField(wireName: 'number_responded_to')
  int? get numberRespondedTo;

  String? get name;

  String? get item;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          ScenarioResultsCustomersRecordBuilder builder) =>
      builder
        ..psrGroupName = ''
        ..numberImpacted = 0
        ..numberRespondedTo = 0
        ..name = ''
        ..item = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scenario_results_customers');

  static Stream<ScenarioResultsCustomersRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScenarioResultsCustomersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScenarioResultsCustomersRecord._();
  factory ScenarioResultsCustomersRecord(
          [void Function(ScenarioResultsCustomersRecordBuilder) updates]) =
      _$ScenarioResultsCustomersRecord;

  static ScenarioResultsCustomersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScenarioResultsCustomersRecordData({
  DocumentReference? scenario,
  String? psrGroupName,
  DocumentReference? psrGroup,
  int? numberImpacted,
  int? numberRespondedTo,
  String? name,
  String? item,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioResultsCustomersRecord.serializer,
    ScenarioResultsCustomersRecord(
      (s) => s
        ..scenario = scenario
        ..psrGroupName = psrGroupName
        ..psrGroup = psrGroup
        ..numberImpacted = numberImpacted
        ..numberRespondedTo = numberRespondedTo
        ..name = name
        ..item = item,
    ),
  );

  return firestoreData;
}
