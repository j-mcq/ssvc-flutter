import 'dart:async';

import 'package:collection/collection.dart';

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

  // "nearest_depot" field.
  DocumentReference? _nearestDepot;
  DocumentReference? get nearestDepot => _nearestDepot;
  bool hasNearestDepot() => _nearestDepot != null;

  // "nearest_depot_name" field.
  String? _nearestDepotName;
  String get nearestDepotName => _nearestDepotName ?? '';
  bool hasNearestDepotName() => _nearestDepotName != null;

  // "response_coverage_all" field.
  double? _responseCoverageAll;
  double get responseCoverageAll => _responseCoverageAll ?? 0.0;
  bool hasResponseCoverageAll() => _responseCoverageAll != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _scenario = snapshotData['scenario'] as DocumentReference?;
    _psrHouseholdsImpacted =
        castToType<int>(snapshotData['psr_households_impacted']);
    _responseCoverage = castToType<double>(snapshotData['response_coverage']);
    _totalCost = castToType<double>(snapshotData['total_cost']);
    _numberOfResponseItems =
        castToType<double>(snapshotData['number_of_response_items']);
    _nearestDepot = snapshotData['nearest_depot'] as DocumentReference?;
    _nearestDepotName = snapshotData['nearest_depot_name'] as String?;
    _responseCoverageAll =
        castToType<double>(snapshotData['response_coverage_all']);
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

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScenarioResultsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScenarioResultsRecordData({
  DocumentReference? scenario,
  int? psrHouseholdsImpacted,
  double? responseCoverage,
  double? totalCost,
  double? numberOfResponseItems,
  DocumentReference? nearestDepot,
  String? nearestDepotName,
  double? responseCoverageAll,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'scenario': scenario,
      'psr_households_impacted': psrHouseholdsImpacted,
      'response_coverage': responseCoverage,
      'total_cost': totalCost,
      'number_of_response_items': numberOfResponseItems,
      'nearest_depot': nearestDepot,
      'nearest_depot_name': nearestDepotName,
      'response_coverage_all': responseCoverageAll,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScenarioResultsRecordDocumentEquality
    implements Equality<ScenarioResultsRecord> {
  const ScenarioResultsRecordDocumentEquality();

  @override
  bool equals(ScenarioResultsRecord? e1, ScenarioResultsRecord? e2) {
    return e1?.scenario == e2?.scenario &&
        e1?.psrHouseholdsImpacted == e2?.psrHouseholdsImpacted &&
        e1?.responseCoverage == e2?.responseCoverage &&
        e1?.totalCost == e2?.totalCost &&
        e1?.numberOfResponseItems == e2?.numberOfResponseItems &&
        e1?.nearestDepot == e2?.nearestDepot &&
        e1?.nearestDepotName == e2?.nearestDepotName &&
        e1?.responseCoverageAll == e2?.responseCoverageAll;
  }

  @override
  int hash(ScenarioResultsRecord? e) => const ListEquality().hash([
        e?.scenario,
        e?.psrHouseholdsImpacted,
        e?.responseCoverage,
        e?.totalCost,
        e?.numberOfResponseItems,
        e?.nearestDepot,
        e?.nearestDepotName,
        e?.responseCoverageAll
      ]);

  @override
  bool isValidKey(Object? o) => o is ScenarioResultsRecord;
}
