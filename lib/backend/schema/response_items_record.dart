import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseItemsRecord extends FirestoreRecord {
  ResponseItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date_added" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "image_link" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  bool hasImageLink() => _imageLink != null;

  // "unit_price" field.
  double? _unitPrice;
  double get unitPrice => _unitPrice ?? 0.0;
  bool hasUnitPrice() => _unitPrice != null;

  // "stock" field.
  double? _stock;
  double get stock => _stock ?? 0.0;
  bool hasStock() => _stock != null;

  // "depot_name" field.
  String? _depotName;
  String get depotName => _depotName ?? '';
  bool hasDepotName() => _depotName != null;

  // "total_energy_storage_capacity" field.
  double? _totalEnergyStorageCapacity;
  double get totalEnergyStorageCapacity => _totalEnergyStorageCapacity ?? 0.0;
  bool hasTotalEnergyStorageCapacity() => _totalEnergyStorageCapacity != null;

  // "surge_power" field.
  double? _surgePower;
  double get surgePower => _surgePower ?? 0.0;
  bool hasSurgePower() => _surgePower != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "baseline_power" field.
  double? _baselinePower;
  double get baselinePower => _baselinePower ?? 0.0;
  bool hasBaselinePower() => _baselinePower != null;

  // "depot" field.
  DocumentReference? _depot;
  DocumentReference? get depot => _depot;
  bool hasDepot() => _depot != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _imageLink = snapshotData['image_link'] as String?;
    _unitPrice = castToType<double>(snapshotData['unit_price']);
    _stock = castToType<double>(snapshotData['stock']);
    _depotName = snapshotData['depot_name'] as String?;
    _totalEnergyStorageCapacity =
        castToType<double>(snapshotData['total_energy_storage_capacity']);
    _surgePower = castToType<double>(snapshotData['surge_power']);
    _weight = castToType<double>(snapshotData['weight']);
    _baselinePower = castToType<double>(snapshotData['baseline_power']);
    _depot = snapshotData['depot'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('response_items');

  static Stream<ResponseItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponseItemsRecord.fromSnapshot(s));

  static Future<ResponseItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponseItemsRecord.fromSnapshot(s));

  static ResponseItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponseItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponseItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponseItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponseItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponseItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponseItemsRecordData({
  String? name,
  String? description,
  DateTime? dateAdded,
  String? imageLink,
  double? unitPrice,
  double? stock,
  String? depotName,
  double? totalEnergyStorageCapacity,
  double? surgePower,
  double? weight,
  double? baselinePower,
  DocumentReference? depot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'date_added': dateAdded,
      'image_link': imageLink,
      'unit_price': unitPrice,
      'stock': stock,
      'depot_name': depotName,
      'total_energy_storage_capacity': totalEnergyStorageCapacity,
      'surge_power': surgePower,
      'weight': weight,
      'baseline_power': baselinePower,
      'depot': depot,
    }.withoutNulls,
  );

  return firestoreData;
}
