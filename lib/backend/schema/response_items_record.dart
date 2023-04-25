import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'response_items_record.g.dart';

abstract class ResponseItemsRecord
    implements Built<ResponseItemsRecord, ResponseItemsRecordBuilder> {
  static Serializer<ResponseItemsRecord> get serializer =>
      _$responseItemsRecordSerializer;

  String? get name;

  String? get description;

  @BuiltValueField(wireName: 'date_added')
  DateTime? get dateAdded;

  @BuiltValueField(wireName: 'image_link')
  String? get imageLink;

  @BuiltValueField(wireName: 'unit_price')
  double? get unitPrice;

  double? get stock;

  DocumentReference? get depot;

  @BuiltValueField(wireName: 'depot_name')
  String? get depotName;

  @BuiltValueField(wireName: 'total_energy_storage_capacity')
  double? get totalEnergyStorageCapacity;

  @BuiltValueField(wireName: 'surge_power')
  double? get surgePower;

  double? get weight;

  @BuiltValueField(wireName: 'baseline_power')
  double? get baselinePower;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ResponseItemsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..imageLink = ''
    ..unitPrice = 0.0
    ..stock = 0.0
    ..depotName = ''
    ..totalEnergyStorageCapacity = 0.0
    ..surgePower = 0.0
    ..weight = 0.0
    ..baselinePower = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('response_items');

  static Stream<ResponseItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ResponseItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ResponseItemsRecord._();
  factory ResponseItemsRecord(
          [void Function(ResponseItemsRecordBuilder) updates]) =
      _$ResponseItemsRecord;

  static ResponseItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createResponseItemsRecordData({
  String? name,
  String? description,
  DateTime? dateAdded,
  String? imageLink,
  double? unitPrice,
  double? stock,
  DocumentReference? depot,
  String? depotName,
  double? totalEnergyStorageCapacity,
  double? surgePower,
  double? weight,
  double? baselinePower,
}) {
  final firestoreData = serializers.toFirestore(
    ResponseItemsRecord.serializer,
    ResponseItemsRecord(
      (r) => r
        ..name = name
        ..description = description
        ..dateAdded = dateAdded
        ..imageLink = imageLink
        ..unitPrice = unitPrice
        ..stock = stock
        ..depot = depot
        ..depotName = depotName
        ..totalEnergyStorageCapacity = totalEnergyStorageCapacity
        ..surgePower = surgePower
        ..weight = weight
        ..baselinePower = baselinePower,
    ),
  );

  return firestoreData;
}
