import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'psr_categories_record.g.dart';

abstract class PsrCategoriesRecord
    implements Built<PsrCategoriesRecord, PsrCategoriesRecordBuilder> {
  static Serializer<PsrCategoriesRecord> get serializer =>
      _$psrCategoriesRecordSerializer;

  @BuiltValueField(wireName: 'psr_category')
  DocumentReference? get psrCategory;

  DocumentReference? get owner;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PsrCategoriesRecordBuilder builder) => builder;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('psr_categories')
          : FirebaseFirestore.instance.collectionGroup('psr_categories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('psr_categories').doc();

  static Stream<PsrCategoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PsrCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PsrCategoriesRecord._();
  factory PsrCategoriesRecord(
          [void Function(PsrCategoriesRecordBuilder) updates]) =
      _$PsrCategoriesRecord;

  static PsrCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPsrCategoriesRecordData({
  DocumentReference? psrCategory,
  DocumentReference? owner,
}) {
  final firestoreData = serializers.toFirestore(
    PsrCategoriesRecord.serializer,
    PsrCategoriesRecord(
      (p) => p
        ..psrCategory = psrCategory
        ..owner = owner,
    ),
  );

  return firestoreData;
}
