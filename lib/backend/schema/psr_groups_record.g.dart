// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psr_groups_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PsrGroupsRecord> _$psrGroupsRecordSerializer =
    new _$PsrGroupsRecordSerializer();

class _$PsrGroupsRecordSerializer
    implements StructuredSerializer<PsrGroupsRecord> {
  @override
  final Iterable<Type> types = const [PsrGroupsRecord, _$PsrGroupsRecord];
  @override
  final String wireName = 'PsrGroupsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PsrGroupsRecord object,
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
  PsrGroupsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PsrGroupsRecordBuilder();

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

class _$PsrGroupsRecord extends PsrGroupsRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PsrGroupsRecord([void Function(PsrGroupsRecordBuilder)? updates]) =>
      (new PsrGroupsRecordBuilder()..update(updates))._build();

  _$PsrGroupsRecord._({this.name, this.ffRef}) : super._();

  @override
  PsrGroupsRecord rebuild(void Function(PsrGroupsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PsrGroupsRecordBuilder toBuilder() =>
      new PsrGroupsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PsrGroupsRecord &&
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
    return (newBuiltValueToStringHelper(r'PsrGroupsRecord')
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PsrGroupsRecordBuilder
    implements Builder<PsrGroupsRecord, PsrGroupsRecordBuilder> {
  _$PsrGroupsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PsrGroupsRecordBuilder() {
    PsrGroupsRecord._initializeBuilder(this);
  }

  PsrGroupsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PsrGroupsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PsrGroupsRecord;
  }

  @override
  void update(void Function(PsrGroupsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PsrGroupsRecord build() => _build();

  _$PsrGroupsRecord _build() {
    final _$result = _$v ?? new _$PsrGroupsRecord._(name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
