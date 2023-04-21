// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psr_categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PsrCategoriesRecord> _$psrCategoriesRecordSerializer =
    new _$PsrCategoriesRecordSerializer();

class _$PsrCategoriesRecordSerializer
    implements StructuredSerializer<PsrCategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    PsrCategoriesRecord,
    _$PsrCategoriesRecord
  ];
  @override
  final String wireName = 'PsrCategoriesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PsrCategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.psrCategory;
    if (value != null) {
      result
        ..add('psr_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PsrCategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PsrCategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'psr_category':
          result.psrCategory = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PsrCategoriesRecord extends PsrCategoriesRecord {
  @override
  final DocumentReference<Object?>? psrCategory;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PsrCategoriesRecord(
          [void Function(PsrCategoriesRecordBuilder)? updates]) =>
      (new PsrCategoriesRecordBuilder()..update(updates))._build();

  _$PsrCategoriesRecord._({this.psrCategory, this.ffRef}) : super._();

  @override
  PsrCategoriesRecord rebuild(
          void Function(PsrCategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PsrCategoriesRecordBuilder toBuilder() =>
      new PsrCategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PsrCategoriesRecord &&
        psrCategory == other.psrCategory &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, psrCategory.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PsrCategoriesRecord')
          ..add('psrCategory', psrCategory)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PsrCategoriesRecordBuilder
    implements Builder<PsrCategoriesRecord, PsrCategoriesRecordBuilder> {
  _$PsrCategoriesRecord? _$v;

  DocumentReference<Object?>? _psrCategory;
  DocumentReference<Object?>? get psrCategory => _$this._psrCategory;
  set psrCategory(DocumentReference<Object?>? psrCategory) =>
      _$this._psrCategory = psrCategory;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PsrCategoriesRecordBuilder() {
    PsrCategoriesRecord._initializeBuilder(this);
  }

  PsrCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _psrCategory = $v.psrCategory;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PsrCategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PsrCategoriesRecord;
  }

  @override
  void update(void Function(PsrCategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PsrCategoriesRecord build() => _build();

  _$PsrCategoriesRecord _build() {
    final _$result = _$v ??
        new _$PsrCategoriesRecord._(psrCategory: psrCategory, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
