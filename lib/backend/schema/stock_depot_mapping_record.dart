import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockDepotMappingRecord extends FirestoreRecord {
  StockDepotMappingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "response_item_name" field.
  String? _responseItemName;
  String get responseItemName => _responseItemName ?? '';
  bool hasResponseItemName() => _responseItemName != null;

  // "number_in_stock" field.
  int? _numberInStock;
  int get numberInStock => _numberInStock ?? 0;
  bool hasNumberInStock() => _numberInStock != null;

  // "response_item" field.
  DocumentReference? _responseItem;
  DocumentReference? get responseItem => _responseItem;
  bool hasResponseItem() => _responseItem != null;

  // "depot" field.
  DocumentReference? _depot;
  DocumentReference? get depot => _depot;
  bool hasDepot() => _depot != null;

  // "depot_name" field.
  String? _depotName;
  String get depotName => _depotName ?? '';
  bool hasDepotName() => _depotName != null;

  void _initializeFields() {
    _responseItemName = snapshotData['response_item_name'] as String?;
    _numberInStock = castToType<int>(snapshotData['number_in_stock']);
    _responseItem = snapshotData['response_item'] as DocumentReference?;
    _depot = snapshotData['depot'] as DocumentReference?;
    _depotName = snapshotData['depot_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stock_depot_mapping');

  static Stream<StockDepotMappingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockDepotMappingRecord.fromSnapshot(s));

  static Future<StockDepotMappingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StockDepotMappingRecord.fromSnapshot(s));

  static StockDepotMappingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockDepotMappingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockDepotMappingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockDepotMappingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockDepotMappingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockDepotMappingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockDepotMappingRecordData({
  String? responseItemName,
  int? numberInStock,
  DocumentReference? responseItem,
  DocumentReference? depot,
  String? depotName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'response_item_name': responseItemName,
      'number_in_stock': numberInStock,
      'response_item': responseItem,
      'depot': depot,
      'depot_name': depotName,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockDepotMappingRecordDocumentEquality
    implements Equality<StockDepotMappingRecord> {
  const StockDepotMappingRecordDocumentEquality();

  @override
  bool equals(StockDepotMappingRecord? e1, StockDepotMappingRecord? e2) {
    return e1?.responseItemName == e2?.responseItemName &&
        e1?.numberInStock == e2?.numberInStock &&
        e1?.responseItem == e2?.responseItem &&
        e1?.depot == e2?.depot &&
        e1?.depotName == e2?.depotName;
  }

  @override
  int hash(StockDepotMappingRecord? e) => const ListEquality().hash([
        e?.responseItemName,
        e?.numberInStock,
        e?.responseItem,
        e?.depot,
        e?.depotName
      ]);

  @override
  bool isValidKey(Object? o) => o is StockDepotMappingRecord;
}
