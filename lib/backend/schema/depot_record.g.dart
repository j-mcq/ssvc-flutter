// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depot_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DepotRecord> _$depotRecordSerializer = new _$DepotRecordSerializer();

class _$DepotRecordSerializer implements StructuredSerializer<DepotRecord> {
  @override
  final Iterable<Type> types = const [DepotRecord, _$DepotRecord];
  @override
  final String wireName = 'DepotRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DepotRecord object,
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
  DepotRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DepotRecordBuilder();

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

class _$DepotRecord extends DepotRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DepotRecord([void Function(DepotRecordBuilder)? updates]) =>
      (new DepotRecordBuilder()..update(updates))._build();

  _$DepotRecord._({this.name, this.ffRef}) : super._();

  @override
  DepotRecord rebuild(void Function(DepotRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DepotRecordBuilder toBuilder() => new DepotRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DepotRecord && name == other.name && ffRef == other.ffRef;
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
    return (newBuiltValueToStringHelper(r'DepotRecord')
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DepotRecordBuilder implements Builder<DepotRecord, DepotRecordBuilder> {
  _$DepotRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DepotRecordBuilder() {
    DepotRecord._initializeBuilder(this);
  }

  DepotRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DepotRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DepotRecord;
  }

  @override
  void update(void Function(DepotRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DepotRecord build() => _build();

  _$DepotRecord _build() {
    final _$result = _$v ?? new _$DepotRecord._(name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
