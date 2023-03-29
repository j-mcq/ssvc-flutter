import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scenario_record.g.dart';

abstract class ScenarioRecord
    implements Built<ScenarioRecord, ScenarioRecordBuilder> {
  static Serializer<ScenarioRecord> get serializer =>
      _$scenarioRecordSerializer;

  String? get name;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'properties_impacted')
  int? get propertiesImpacted;

  @BuiltValueField(wireName: 'outage_duration')
  double? get outageDuration;

  @BuiltValueField(wireName: 'percentage_coverered')
  double? get percentageCoverered;

  @BuiltValueField(wireName: 'location_name')
  String? get locationName;

  LatLng? get location;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ScenarioRecordBuilder builder) => builder
    ..name = ''
    ..propertiesImpacted = 0
    ..outageDuration = 0.0
    ..percentageCoverered = 0.0
    ..locationName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scenario');

  static Stream<ScenarioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScenarioRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScenarioRecord._();
  factory ScenarioRecord([void Function(ScenarioRecordBuilder) updates]) =
      _$ScenarioRecord;

  static ScenarioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScenarioRecordData({
  String? name,
  DateTime? timestamp,
  DocumentReference? createdBy,
  int? propertiesImpacted,
  double? outageDuration,
  double? percentageCoverered,
  String? locationName,
  LatLng? location,
}) {
  final firestoreData = serializers.toFirestore(
    ScenarioRecord.serializer,
    ScenarioRecord(
      (s) => s
        ..name = name
        ..timestamp = timestamp
        ..createdBy = createdBy
        ..propertiesImpacted = propertiesImpacted
        ..outageDuration = outageDuration
        ..percentageCoverered = percentageCoverered
        ..locationName = locationName
        ..location = location,
    ),
  );

  return firestoreData;
}
