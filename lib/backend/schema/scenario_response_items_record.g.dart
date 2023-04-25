// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_response_items_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScenarioResponseItemsRecord>
    _$scenarioResponseItemsRecordSerializer =
    new _$ScenarioResponseItemsRecordSerializer();

class _$ScenarioResponseItemsRecordSerializer
    implements StructuredSerializer<ScenarioResponseItemsRecord> {
  @override
  final Iterable<Type> types = const [
    ScenarioResponseItemsRecord,
    _$ScenarioResponseItemsRecord
  ];
  @override
  final String wireName = 'ScenarioResponseItemsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ScenarioResponseItemsRecord object,
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
    value = object.responseItem;
    if (value != null) {
      result
        ..add('response_item')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.numberRequired;
    if (value != null) {
      result
        ..add('number_required')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ScenarioResponseItemsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScenarioResponseItemsRecordBuilder();

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
        case 'response_item':
          result.responseItem = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'number_required':
          result.numberRequired = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ScenarioResponseItemsRecord extends ScenarioResponseItemsRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? responseItem;
  @override
  final int? numberRequired;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioResponseItemsRecord(
          [void Function(ScenarioResponseItemsRecordBuilder)? updates]) =>
      (new ScenarioResponseItemsRecordBuilder()..update(updates))._build();

  _$ScenarioResponseItemsRecord._(
      {this.name, this.responseItem, this.numberRequired, this.ffRef})
      : super._();

  @override
  ScenarioResponseItemsRecord rebuild(
          void Function(ScenarioResponseItemsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScenarioResponseItemsRecordBuilder toBuilder() =>
      new ScenarioResponseItemsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScenarioResponseItemsRecord &&
        name == other.name &&
        responseItem == other.responseItem &&
        numberRequired == other.numberRequired &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, responseItem.hashCode);
    _$hash = $jc(_$hash, numberRequired.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioResponseItemsRecord')
          ..add('name', name)
          ..add('responseItem', responseItem)
          ..add('numberRequired', numberRequired)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScenarioResponseItemsRecordBuilder
    implements
        Builder<ScenarioResponseItemsRecord,
            ScenarioResponseItemsRecordBuilder> {
  _$ScenarioResponseItemsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _responseItem;
  DocumentReference<Object?>? get responseItem => _$this._responseItem;
  set responseItem(DocumentReference<Object?>? responseItem) =>
      _$this._responseItem = responseItem;

  int? _numberRequired;
  int? get numberRequired => _$this._numberRequired;
  set numberRequired(int? numberRequired) =>
      _$this._numberRequired = numberRequired;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScenarioResponseItemsRecordBuilder() {
    ScenarioResponseItemsRecord._initializeBuilder(this);
  }

  ScenarioResponseItemsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _responseItem = $v.responseItem;
      _numberRequired = $v.numberRequired;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScenarioResponseItemsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScenarioResponseItemsRecord;
  }

  @override
  void update(void Function(ScenarioResponseItemsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScenarioResponseItemsRecord build() => _build();

  _$ScenarioResponseItemsRecord _build() {
    final _$result = _$v ??
        new _$ScenarioResponseItemsRecord._(
            name: name,
            responseItem: responseItem,
            numberRequired: numberRequired,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
