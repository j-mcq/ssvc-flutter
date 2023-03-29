// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_results_customers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScenarioResultsCustomersRecord>
    _$scenarioResultsCustomersRecordSerializer =
    new _$ScenarioResultsCustomersRecordSerializer();

class _$ScenarioResultsCustomersRecordSerializer
    implements StructuredSerializer<ScenarioResultsCustomersRecord> {
  @override
  final Iterable<Type> types = const [
    ScenarioResultsCustomersRecord,
    _$ScenarioResultsCustomersRecord
  ];
  @override
  final String wireName = 'ScenarioResultsCustomersRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ScenarioResultsCustomersRecord object,
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
    value = object.psrGroupName;
    if (value != null) {
      result
        ..add('psr_group_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.psrGroup;
    if (value != null) {
      result
        ..add('psr_group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.numberImpacted;
    if (value != null) {
      result
        ..add('number_impacted')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numberRespondedTo;
    if (value != null) {
      result
        ..add('number_responded_to')
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
  ScenarioResultsCustomersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScenarioResultsCustomersRecordBuilder();

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
        case 'psr_group_name':
          result.psrGroupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'psr_group':
          result.psrGroup = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'number_impacted':
          result.numberImpacted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'number_responded_to':
          result.numberRespondedTo = serializers.deserialize(value,
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

class _$ScenarioResultsCustomersRecord extends ScenarioResultsCustomersRecord {
  @override
  final DocumentReference<Object?>? scenario;
  @override
  final String? psrGroupName;
  @override
  final DocumentReference<Object?>? psrGroup;
  @override
  final int? numberImpacted;
  @override
  final int? numberRespondedTo;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioResultsCustomersRecord(
          [void Function(ScenarioResultsCustomersRecordBuilder)? updates]) =>
      (new ScenarioResultsCustomersRecordBuilder()..update(updates))._build();

  _$ScenarioResultsCustomersRecord._(
      {this.scenario,
      this.psrGroupName,
      this.psrGroup,
      this.numberImpacted,
      this.numberRespondedTo,
      this.ffRef})
      : super._();

  @override
  ScenarioResultsCustomersRecord rebuild(
          void Function(ScenarioResultsCustomersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScenarioResultsCustomersRecordBuilder toBuilder() =>
      new ScenarioResultsCustomersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScenarioResultsCustomersRecord &&
        scenario == other.scenario &&
        psrGroupName == other.psrGroupName &&
        psrGroup == other.psrGroup &&
        numberImpacted == other.numberImpacted &&
        numberRespondedTo == other.numberRespondedTo &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, scenario.hashCode);
    _$hash = $jc(_$hash, psrGroupName.hashCode);
    _$hash = $jc(_$hash, psrGroup.hashCode);
    _$hash = $jc(_$hash, numberImpacted.hashCode);
    _$hash = $jc(_$hash, numberRespondedTo.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioResultsCustomersRecord')
          ..add('scenario', scenario)
          ..add('psrGroupName', psrGroupName)
          ..add('psrGroup', psrGroup)
          ..add('numberImpacted', numberImpacted)
          ..add('numberRespondedTo', numberRespondedTo)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScenarioResultsCustomersRecordBuilder
    implements
        Builder<ScenarioResultsCustomersRecord,
            ScenarioResultsCustomersRecordBuilder> {
  _$ScenarioResultsCustomersRecord? _$v;

  DocumentReference<Object?>? _scenario;
  DocumentReference<Object?>? get scenario => _$this._scenario;
  set scenario(DocumentReference<Object?>? scenario) =>
      _$this._scenario = scenario;

  String? _psrGroupName;
  String? get psrGroupName => _$this._psrGroupName;
  set psrGroupName(String? psrGroupName) => _$this._psrGroupName = psrGroupName;

  DocumentReference<Object?>? _psrGroup;
  DocumentReference<Object?>? get psrGroup => _$this._psrGroup;
  set psrGroup(DocumentReference<Object?>? psrGroup) =>
      _$this._psrGroup = psrGroup;

  int? _numberImpacted;
  int? get numberImpacted => _$this._numberImpacted;
  set numberImpacted(int? numberImpacted) =>
      _$this._numberImpacted = numberImpacted;

  int? _numberRespondedTo;
  int? get numberRespondedTo => _$this._numberRespondedTo;
  set numberRespondedTo(int? numberRespondedTo) =>
      _$this._numberRespondedTo = numberRespondedTo;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScenarioResultsCustomersRecordBuilder() {
    ScenarioResultsCustomersRecord._initializeBuilder(this);
  }

  ScenarioResultsCustomersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _scenario = $v.scenario;
      _psrGroupName = $v.psrGroupName;
      _psrGroup = $v.psrGroup;
      _numberImpacted = $v.numberImpacted;
      _numberRespondedTo = $v.numberRespondedTo;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScenarioResultsCustomersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScenarioResultsCustomersRecord;
  }

  @override
  void update(void Function(ScenarioResultsCustomersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScenarioResultsCustomersRecord build() => _build();

  _$ScenarioResultsCustomersRecord _build() {
    final _$result = _$v ??
        new _$ScenarioResultsCustomersRecord._(
            scenario: scenario,
            psrGroupName: psrGroupName,
            psrGroup: psrGroup,
            numberImpacted: numberImpacted,
            numberRespondedTo: numberRespondedTo,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
