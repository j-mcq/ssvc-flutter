import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PsrCategoryOptionsRecord extends FirestoreRecord {
  PsrCategoryOptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "resilience_score" field.
  double? _resilienceScore;
  double get resilienceScore => _resilienceScore ?? 0.0;
  bool hasResilienceScore() => _resilienceScore != null;

  // "power_consumption" field.
  double? _powerConsumption;
  double get powerConsumption => _powerConsumption ?? 0.0;
  bool hasPowerConsumption() => _powerConsumption != null;

  // "electrically_dependant" field.
  bool? _electricallyDependant;
  bool get electricallyDependant => _electricallyDependant ?? false;
  bool hasElectricallyDependant() => _electricallyDependant != null;

  // "psr_group_name" field.
  String? _psrGroupName;
  String get psrGroupName => _psrGroupName ?? '';
  bool hasPsrGroupName() => _psrGroupName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _resilienceScore = castToType<double>(snapshotData['resilience_score']);
    _powerConsumption = castToType<double>(snapshotData['power_consumption']);
    _electricallyDependant = snapshotData['electrically_dependant'] as bool?;
    _psrGroupName = snapshotData['psr_group_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psr_category_options');

  static Stream<PsrCategoryOptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PsrCategoryOptionsRecord.fromSnapshot(s));

  static Future<PsrCategoryOptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PsrCategoryOptionsRecord.fromSnapshot(s));

  static PsrCategoryOptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PsrCategoryOptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PsrCategoryOptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PsrCategoryOptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PsrCategoryOptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PsrCategoryOptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPsrCategoryOptionsRecordData({
  String? name,
  double? resilienceScore,
  double? powerConsumption,
  bool? electricallyDependant,
  String? psrGroupName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'resilience_score': resilienceScore,
      'power_consumption': powerConsumption,
      'electrically_dependant': electricallyDependant,
      'psr_group_name': psrGroupName,
    }.withoutNulls,
  );

  return firestoreData;
}
