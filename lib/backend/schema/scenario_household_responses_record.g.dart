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
    value = object.cost;
    if (value != null) {
      result
        ..add('cost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.responseItemName;
    if (value != null) {
      result
        ..add('response_item_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scenario;
    if (value != null) {
      result
        ..add('scenario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.powerRequired;
    if (value != null) {
      result
        ..add('power_required')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.postcode;
    if (value != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.psrCategories;
    if (value != null) {
      result
        ..add('psr_categories')
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
        case 'cost':
          result.cost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'response_item_name':
          result.responseItemName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'scenario':
          result.scenario = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'power_required':
          result.powerRequired = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'psr_categories':
          result.psrCategories = serializers.deserialize(value,
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

class _$ScenarioHouseholdResponsesRecord
    extends ScenarioHouseholdResponsesRecord {
  @override
  final DocumentReference<Object?>? responseItem;
  @override
  final double? cost;
  @override
  final String? responseItemName;
  @override
  final DocumentReference<Object?>? scenario;
  @override
  final double? powerRequired;
  @override
  final String? postcode;
  @override
  final String? psrCategories;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioHouseholdResponsesRecord(
          [void Function(ScenarioHouseholdResponsesRecordBuilder)? updates]) =>
      (new ScenarioHouseholdResponsesRecordBuilder()..update(updates))._build();

  _$ScenarioHouseholdResponsesRecord._(
      {this.responseItem,
      this.cost,
      this.responseItemName,
      this.scenario,
      this.powerRequired,
      this.postcode,
      this.psrCategories,
      this.ffRef})
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
        cost == other.cost &&
        responseItemName == other.responseItemName &&
        scenario == other.scenario &&
        powerRequired == other.powerRequired &&
        postcode == other.postcode &&
        psrCategories == other.psrCategories &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, responseItem.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, responseItemName.hashCode);
    _$hash = $jc(_$hash, scenario.hashCode);
    _$hash = $jc(_$hash, powerRequired.hashCode);
    _$hash = $jc(_$hash, postcode.hashCode);
    _$hash = $jc(_$hash, psrCategories.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioHouseholdResponsesRecord')
          ..add('responseItem', responseItem)
          ..add('cost', cost)
          ..add('responseItemName', responseItemName)
          ..add('scenario', scenario)
          ..add('powerRequired', powerRequired)
          ..add('postcode', postcode)
          ..add('psrCategories', psrCategories)
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

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  String? _responseItemName;
  String? get responseItemName => _$this._responseItemName;
  set responseItemName(String? responseItemName) =>
      _$this._responseItemName = responseItemName;

  DocumentReference<Object?>? _scenario;
  DocumentReference<Object?>? get scenario => _$this._scenario;
  set scenario(DocumentReference<Object?>? scenario) =>
      _$this._scenario = scenario;

  double? _powerRequired;
  double? get powerRequired => _$this._powerRequired;
  set powerRequired(double? powerRequired) =>
      _$this._powerRequired = powerRequired;

  String? _postcode;
  String? get postcode => _$this._postcode;
  set postcode(String? postcode) => _$this._postcode = postcode;

  String? _psrCategories;
  String? get psrCategories => _$this._psrCategories;
  set psrCategories(String? psrCategories) =>
      _$this._psrCategories = psrCategories;

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
      _cost = $v.cost;
      _responseItemName = $v.responseItemName;
      _scenario = $v.scenario;
      _powerRequired = $v.powerRequired;
      _postcode = $v.postcode;
      _psrCategories = $v.psrCategories;
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
            cost: cost,
            responseItemName: responseItemName,
            scenario: scenario,
            powerRequired: powerRequired,
            postcode: postcode,
            psrCategories: psrCategories,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
