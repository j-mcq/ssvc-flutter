// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_results_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScenarioResultsRecord> _$scenarioResultsRecordSerializer =
    new _$ScenarioResultsRecordSerializer();

class _$ScenarioResultsRecordSerializer
    implements StructuredSerializer<ScenarioResultsRecord> {
  @override
  final Iterable<Type> types = const [
    ScenarioResultsRecord,
    _$ScenarioResultsRecord
  ];
  @override
  final String wireName = 'ScenarioResultsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ScenarioResultsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.scenario;
    if (value != null) {
      result
        ..add('scenario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
    value = object.responseItemName;
    if (value != null) {
      result
        ..add('response_item_name')
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
  ScenarioResultsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScenarioResultsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'scenario':
          result.scenario = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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
        case 'response_item_name':
          result.responseItemName = serializers.deserialize(value,
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

class _$ScenarioResultsRecord extends ScenarioResultsRecord {
  @override
  final DocumentReference<Object?>? scenario;
  @override
  final DocumentReference<Object?>? responseItem;
  @override
  final int? numberRequired;
  @override
  final String? responseItemName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioResultsRecord(
          [void Function(ScenarioResultsRecordBuilder)? updates]) =>
      (new ScenarioResultsRecordBuilder()..update(updates))._build();

  _$ScenarioResultsRecord._(
      {this.scenario,
      this.responseItem,
      this.numberRequired,
      this.responseItemName,
      this.ffRef})
      : super._();

  @override
  ScenarioResultsRecord rebuild(
          void Function(ScenarioResultsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScenarioResultsRecordBuilder toBuilder() =>
      new ScenarioResultsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScenarioResultsRecord &&
        scenario == other.scenario &&
        responseItem == other.responseItem &&
        numberRequired == other.numberRequired &&
        responseItemName == other.responseItemName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, scenario.hashCode);
    _$hash = $jc(_$hash, responseItem.hashCode);
    _$hash = $jc(_$hash, numberRequired.hashCode);
    _$hash = $jc(_$hash, responseItemName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioResultsRecord')
          ..add('scenario', scenario)
          ..add('responseItem', responseItem)
          ..add('numberRequired', numberRequired)
          ..add('responseItemName', responseItemName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScenarioResultsRecordBuilder
    implements Builder<ScenarioResultsRecord, ScenarioResultsRecordBuilder> {
  _$ScenarioResultsRecord? _$v;

  DocumentReference<Object?>? _scenario;
  DocumentReference<Object?>? get scenario => _$this._scenario;
  set scenario(DocumentReference<Object?>? scenario) =>
      _$this._scenario = scenario;

  DocumentReference<Object?>? _responseItem;
  DocumentReference<Object?>? get responseItem => _$this._responseItem;
  set responseItem(DocumentReference<Object?>? responseItem) =>
      _$this._responseItem = responseItem;

  int? _numberRequired;
  int? get numberRequired => _$this._numberRequired;
  set numberRequired(int? numberRequired) =>
      _$this._numberRequired = numberRequired;

  String? _responseItemName;
  String? get responseItemName => _$this._responseItemName;
  set responseItemName(String? responseItemName) =>
      _$this._responseItemName = responseItemName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScenarioResultsRecordBuilder() {
    ScenarioResultsRecord._initializeBuilder(this);
  }

  ScenarioResultsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _scenario = $v.scenario;
      _responseItem = $v.responseItem;
      _numberRequired = $v.numberRequired;
      _responseItemName = $v.responseItemName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScenarioResultsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScenarioResultsRecord;
  }

  @override
  void update(void Function(ScenarioResultsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScenarioResultsRecord build() => _build();

  _$ScenarioResultsRecord _build() {
    final _$result = _$v ??
        new _$ScenarioResultsRecord._(
            scenario: scenario,
            responseItem: responseItem,
            numberRequired: numberRequired,
            responseItemName: responseItemName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
