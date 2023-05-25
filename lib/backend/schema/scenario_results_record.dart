import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScenarioResultsRecord extends FirestoreRecord {
  ScenarioResultsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "scenario" field.
  DocumentReference? _scenario;
  DocumentReference? get scenario => _scenario;
  bool hasScenario() => _scenario != null;

  // "psr_households_impacted" field.
  int? _psrHouseholdsImpacted;
  int get psrHouseholdsImpacted => _psrHouseholdsImpacted ?? 0;
  bool hasPsrHouseholdsImpacted() => _psrHouseholdsImpacted != null;

  // "response_coverage" field.
  double? _responseCoverage;
  double get responseCoverage => _responseCoverage ?? 0.0;
  bool hasResponseCoverage() => _responseCoverage != null;

  // "total_cost" field.
  double? _totalCost;
  double get totalCost => _totalCost ?? 0.0;
  bool hasTotalCost() => _totalCost != null;

  // "number_of_response_items" field.
  double? _numberOfResponseItems;
  double get numberOfResponseItems => _numberOfResponseItems ?? 0.0;
  bool hasNumberOfResponseItems() => _numberOfResponseItems != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _scenario = snapshotData['scenario'] as DocumentReference?;
    _psrHouseholdsImpacted = snapshotData['psr_households_impacted'] as int?;
    _responseCoverage = castToType<double>(snapshotData['response_coverage']);
    _totalCost = castToType<double>(snapshotData['total_cost']);
    _numberOfResponseItems =
        castToType<double>(snapshotData['number_of_response_items']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scenario_results')
          : FirebaseFirestore.instance.collectionGroup('scenario_results');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scenario_results').doc();

  static Stream<ScenarioResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScenarioResultsRecord.fromSnapshot(s));

  static Future<ScenarioResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScenarioResultsRecord.fromSnapshot(s));

  static ScenarioResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScenarioResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScenarioResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScenarioResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScenarioResultsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createScenarioResultsRecordData({
  DocumentReference? scenario,
  int? psrHouseholdsImpacted,
  double? responseCoverage,
  double? totalCost,
  double? numberOfResponseItems,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'scenario': scenario,
      'psr_households_impacted': psrHouseholdsImpacted,
      'response_coverage': responseCoverage,
      'total_cost': totalCost,
      'number_of_response_items': numberOfResponseItems,
    }.withoutNulls,
  );

  return firestoreData;
}
