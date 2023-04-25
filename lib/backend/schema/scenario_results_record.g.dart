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
    value = object.psrHouseholdsImpacted;
    if (value != null) {
      result
        ..add('psr_households_impacted')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.responseCoverage;
    if (value != null) {
      result
        ..add('response_coverage')
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
        case 'psr_households_impacted':
          result.psrHouseholdsImpacted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'response_coverage':
          result.responseCoverage = serializers.deserialize(value,
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

class _$ScenarioResultsRecord extends ScenarioResultsRecord {
  @override
  final DocumentReference<Object?>? scenario;
  @override
  final int? psrHouseholdsImpacted;
  @override
  final double? responseCoverage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioResultsRecord(
          [void Function(ScenarioResultsRecordBuilder)? updates]) =>
      (new ScenarioResultsRecordBuilder()..update(updates))._build();

  _$ScenarioResultsRecord._(
      {this.scenario,
      this.psrHouseholdsImpacted,
      this.responseCoverage,
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
        psrHouseholdsImpacted == other.psrHouseholdsImpacted &&
        responseCoverage == other.responseCoverage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, scenario.hashCode);
    _$hash = $jc(_$hash, psrHouseholdsImpacted.hashCode);
    _$hash = $jc(_$hash, responseCoverage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioResultsRecord')
          ..add('scenario', scenario)
          ..add('psrHouseholdsImpacted', psrHouseholdsImpacted)
          ..add('responseCoverage', responseCoverage)
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

  int? _psrHouseholdsImpacted;
  int? get psrHouseholdsImpacted => _$this._psrHouseholdsImpacted;
  set psrHouseholdsImpacted(int? psrHouseholdsImpacted) =>
      _$this._psrHouseholdsImpacted = psrHouseholdsImpacted;

  double? _responseCoverage;
  double? get responseCoverage => _$this._responseCoverage;
  set responseCoverage(double? responseCoverage) =>
      _$this._responseCoverage = responseCoverage;

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
      _psrHouseholdsImpacted = $v.psrHouseholdsImpacted;
      _responseCoverage = $v.responseCoverage;
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
            psrHouseholdsImpacted: psrHouseholdsImpacted,
            responseCoverage: responseCoverage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
