import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScenarioHouseholdResponsesRecord extends FirestoreRecord {
  ScenarioHouseholdResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "response_item" field.
  DocumentReference? _responseItem;
  DocumentReference? get responseItem => _responseItem;
  bool hasResponseItem() => _responseItem != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  // "response_item_name" field.
  String? _responseItemName;
  String get responseItemName => _responseItemName ?? '';
  bool hasResponseItemName() => _responseItemName != null;

  // "scenario" field.
  DocumentReference? _scenario;
  DocumentReference? get scenario => _scenario;
  bool hasScenario() => _scenario != null;

  // "power_required" field.
  double? _powerRequired;
  double get powerRequired => _powerRequired ?? 0.0;
  bool hasPowerRequired() => _powerRequired != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  bool hasPostcode() => _postcode != null;

  // "psr_categories" field.
  String? _psrCategories;
  String get psrCategories => _psrCategories ?? '';
  bool hasPsrCategories() => _psrCategories != null;

  // "priority" field.
  double? _priority;
  double get priority => _priority ?? 0.0;
  bool hasPriority() => _priority != null;

  // "highest_resilience_score" field.
  double? _highestResilienceScore;
  double get highestResilienceScore => _highestResilienceScore ?? 0.0;
  bool hasHighestResilienceScore() => _highestResilienceScore != null;

  // "needs_recharging" field.
  bool? _needsRecharging;
  bool get needsRecharging => _needsRecharging ?? false;
  bool hasNeedsRecharging() => _needsRecharging != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _responseItem = snapshotData['response_item'] as DocumentReference?;
    _cost = castToType<double>(snapshotData['cost']);
    _responseItemName = snapshotData['response_item_name'] as String?;
    _scenario = snapshotData['scenario'] as DocumentReference?;
    _powerRequired = castToType<double>(snapshotData['power_required']);
    _postcode = snapshotData['postcode'] as String?;
    _psrCategories = snapshotData['psr_categories'] as String?;
    _priority = castToType<double>(snapshotData['priority']);
    _highestResilienceScore =
        castToType<double>(snapshotData['highest_resilience_score']);
    _needsRecharging = snapshotData['needs_recharging'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scenario_household_responses')
          : FirebaseFirestore.instance
              .collectionGroup('scenario_household_responses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scenario_household_responses').doc();

  static Stream<ScenarioHouseholdResponsesRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ScenarioHouseholdResponsesRecord.fromSnapshot(s));

  static Future<ScenarioHouseholdResponsesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ScenarioHouseholdResponsesRecord.fromSnapshot(s));

  static ScenarioHouseholdResponsesRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ScenarioHouseholdResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScenarioHouseholdResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScenarioHouseholdResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScenarioHouseholdResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScenarioHouseholdResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScenarioHouseholdResponsesRecordData({
  DocumentReference? responseItem,
  double? cost,
  String? responseItemName,
  DocumentReference? scenario,
  double? powerRequired,
  String? postcode,
  String? psrCategories,
  double? priority,
  double? highestResilienceScore,
  bool? needsRecharging,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'response_item': responseItem,
      'cost': cost,
      'response_item_name': responseItemName,
      'scenario': scenario,
      'power_required': powerRequired,
      'postcode': postcode,
      'psr_categories': psrCategories,
      'priority': priority,
      'highest_resilience_score': highestResilienceScore,
      'needs_recharging': needsRecharging,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScenarioHouseholdResponsesRecordDocumentEquality
    implements Equality<ScenarioHouseholdResponsesRecord> {
  const ScenarioHouseholdResponsesRecordDocumentEquality();

  @override
  bool equals(ScenarioHouseholdResponsesRecord? e1,
      ScenarioHouseholdResponsesRecord? e2) {
    return e1?.responseItem == e2?.responseItem &&
        e1?.cost == e2?.cost &&
        e1?.responseItemName == e2?.responseItemName &&
        e1?.scenario == e2?.scenario &&
        e1?.powerRequired == e2?.powerRequired &&
        e1?.postcode == e2?.postcode &&
        e1?.psrCategories == e2?.psrCategories &&
        e1?.priority == e2?.priority &&
        e1?.highestResilienceScore == e2?.highestResilienceScore &&
        e1?.needsRecharging == e2?.needsRecharging;
  }

  @override
  int hash(ScenarioHouseholdResponsesRecord? e) => const ListEquality().hash([
        e?.responseItem,
        e?.cost,
        e?.responseItemName,
        e?.scenario,
        e?.powerRequired,
        e?.postcode,
        e?.psrCategories,
        e?.priority,
        e?.highestResilienceScore,
        e?.needsRecharging
      ]);

  @override
  bool isValidKey(Object? o) => o is ScenarioHouseholdResponsesRecord;
}
