import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'depot_record.g.dart';

abstract class DepotRecord implements Built<DepotRecord, DepotRecordBuilder> {
  static Serializer<DepotRecord> get serializer => _$depotRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DepotRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('depot');

  static Stream<DepotRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DepotRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DepotRecord._();
  factory DepotRecord([void Function(DepotRecordBuilder) updates]) =
      _$DepotRecord;

  static DepotRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDepotRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    DepotRecord.serializer,
    DepotRecord(
      (d) => d..name = name,
    ),
  );

  return firestoreData;
}
