// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_household_responses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScenarioHouseholdResponsesRecord>
    _$scenarioHouseholdResponsesRecordSerializer =
    new _$ScenarioHouseholdResponsesRecordSerializer();

class _$ScenarioHouseholdResponsesRecordSerializer
    implements StructuredSerializer<ScenarioHouseholdResponsesRecord> {
  @override
  final Iterable<Type> types = const [
    ScenarioHouseholdResponsesRecord,
    _$ScenarioHouseholdResponsesRecord
  ];
  @override
  final String wireName = 'ScenarioHouseholdResponsesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ScenarioHouseholdResponsesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.responseItem;
    if (value != null) {
      result
        ..add('response_item')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.responseItemName;
    if (value != null) {
      result
        ..add('response_item_name')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cost;
    if (value != null) {
      result
        ..add('cost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ScenarioHouseholdResponsesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScenarioHouseholdResponsesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'response_item':
          result.responseItem = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'response_item_name':
          result.responseItemName = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cost':
          result.cost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$ScenarioHouseholdResponsesRecord
    extends ScenarioHouseholdResponsesRecord {
  @override
  final DocumentReference<Object?>? responseItem;
  @override
  final int? responseItemName;
  @override
  final double? cost;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioHouseholdResponsesRecord(
          [void Function(ScenarioHouseholdResponsesRecordBuilder)? updates]) =>
      (new ScenarioHouseholdResponsesRecordBuilder()..update(updates))._build();

  _$ScenarioHouseholdResponsesRecord._(
      {this.responseItem, this.responseItemName, this.cost, this.ffRef})
      : super._();

  @override
  ScenarioHouseholdResponsesRecord rebuild(
          void Function(ScenarioHouseholdResponsesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScenarioHouseholdResponsesRecordBuilder toBuilder() =>
      new ScenarioHouseholdResponsesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScenarioHouseholdResponsesRecord &&
        responseItem == other.responseItem &&
        responseItemName == other.responseItemName &&
        cost == other.cost &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, responseItem.hashCode);
    _$hash = $jc(_$hash, responseItemName.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioHouseholdResponsesRecord')
          ..add('responseItem', responseItem)
          ..add('responseItemName', responseItemName)
          ..add('cost', cost)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScenarioHouseholdResponsesRecordBuilder
    implements
        Builder<ScenarioHouseholdResponsesRecord,
            ScenarioHouseholdResponsesRecordBuilder> {
  _$ScenarioHouseholdResponsesRecord? _$v;

  DocumentReference<Object?>? _responseItem;
  DocumentReference<Object?>? get responseItem => _$this._responseItem;
  set responseItem(DocumentReference<Object?>? responseItem) =>
      _$this._responseItem = responseItem;

  int? _responseItemName;
  int? get responseItemName => _$this._responseItemName;
  set responseItemName(int? responseItemName) =>
      _$this._responseItemName = responseItemName;

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScenarioHouseholdResponsesRecordBuilder() {
    ScenarioHouseholdResponsesRecord._initializeBuilder(this);
  }

  ScenarioHouseholdResponsesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _responseItem = $v.responseItem;
      _responseItemName = $v.responseItemName;
      _cost = $v.cost;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScenarioHouseholdResponsesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScenarioHouseholdResponsesRecord;
  }

  @override
  void update(void Function(ScenarioHouseholdResponsesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScenarioHouseholdResponsesRecord build() => _build();

  _$ScenarioHouseholdResponsesRecord _build() {
    final _$result = _$v ??
        new _$ScenarioHouseholdResponsesRecord._(
            responseItem: responseItem,
            responseItemName: responseItemName,
            cost: cost,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
