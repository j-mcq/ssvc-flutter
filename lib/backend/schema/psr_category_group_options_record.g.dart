// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psr_category_group_options_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PsrCategoryGroupOptionsRecord>
    _$psrCategoryGroupOptionsRecordSerializer =
    new _$PsrCategoryGroupOptionsRecordSerializer();

class _$PsrCategoryGroupOptionsRecordSerializer
    implements StructuredSerializer<PsrCategoryGroupOptionsRecord> {
  @override
  final Iterable<Type> types = const [
    PsrCategoryGroupOptionsRecord,
    _$PsrCategoryGroupOptionsRecord
  ];
  @override
  final String wireName = 'PsrCategoryGroupOptionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PsrCategoryGroupOptionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PsrCategoryGroupOptionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PsrCategoryGroupOptionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PsrCategoryGroupOptionsRecord extends PsrCategoryGroupOptionsRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PsrCategoryGroupOptionsRecord(
          [void Function(PsrCategoryGroupOptionsRecordBuilder)? updates]) =>
      (new PsrCategoryGroupOptionsRecordBuilder()..update(updates))._build();

  _$PsrCategoryGroupOptionsRecord._({this.name, this.ffRef}) : super._();

  @override
  PsrCategoryGroupOptionsRecord rebuild(
          void Function(PsrCategoryGroupOptionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PsrCategoryGroupOptionsRecordBuilder toBuilder() =>
      new PsrCategoryGroupOptionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PsrCategoryGroupOptionsRecord &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PsrCategoryGroupOptionsRecord')
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PsrCategoryGroupOptionsRecordBuilder
    implements
        Builder<PsrCategoryGroupOptionsRecord,
            PsrCategoryGroupOptionsRecordBuilder> {
  _$PsrCategoryGroupOptionsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PsrCategoryGroupOptionsRecordBuilder() {
    PsrCategoryGroupOptionsRecord._initializeBuilder(this);
  }

  PsrCategoryGroupOptionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PsrCategoryGroupOptionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PsrCategoryGroupOptionsRecord;
  }

  @override
  void update(void Function(PsrCategoryGroupOptionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PsrCategoryGroupOptionsRecord build() => _build();

  _$PsrCategoryGroupOptionsRecord _build() {
    final _$result =
        _$v ?? new _$PsrCategoryGroupOptionsRecord._(name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
