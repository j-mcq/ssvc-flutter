import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stock_depot_mapping_record.g.dart';

abstract class StockDepotMappingRecord
    implements Built<StockDepotMappingRecord, StockDepotMappingRecordBuilder> {
  static Serializer<StockDepotMappingRecord> get serializer =>
      _$stockDepotMappingRecordSerializer;

  @BuiltValueField(wireName: 'response_item_name')
  String? get responseItemName;

  @BuiltValueField(wireName: 'depot_name')
  String? get depotName;

  @BuiltValueField(wireName: 'number_in_stock')
  int? get numberInStock;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StockDepotMappingRecordBuilder builder) =>
      builder
        ..responseItemName = ''
        ..depotName = ''
        ..numberInStock = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stock_depot_mapping');

  static Stream<StockDepotMappingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StockDepotMappingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StockDepotMappingRecord._();
  factory StockDepotMappingRecord(
          [void Function(StockDepotMappingRecordBuilder) updates]) =
      _$StockDepotMappingRecord;

  static StockDepotMappingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStockDepotMappingRecordData({
  String? responseItemName,
  String? depotName,
  int? numberInStock,
}) {
  final firestoreData = serializers.toFirestore(
    StockDepotMappingRecord.serializer,
    StockDepotMappingRecord(
      (s) => s
        ..responseItemName = responseItemName
        ..depotName = depotName
        ..numberInStock = numberInStock,
    ),
  );

  return firestoreData;
}
