// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psr_category_options_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PsrCategoryOptionsRecord> _$psrCategoryOptionsRecordSerializer =
    new _$PsrCategoryOptionsRecordSerializer();

class _$PsrCategoryOptionsRecordSerializer
    implements StructuredSerializer<PsrCategoryOptionsRecord> {
  @override
  final Iterable<Type> types = const [
    PsrCategoryOptionsRecord,
    _$PsrCategoryOptionsRecord
  ];
  @override
  final String wireName = 'PsrCategoryOptionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PsrCategoryOptionsRecord object,
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
    value = object.psrGroup;
    if (value != null) {
      result
        ..add('psr_group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.resilienceScore;
    if (value != null) {
      result
        ..add('resilience_score')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.powerConsumption;
    if (value != null) {
      result
        ..add('power_consumption')
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
  PsrCategoryOptionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PsrCategoryOptionsRecordBuilder();

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
        case 'psr_group':
          result.psrGroup = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'resilience_score':
          result.resilienceScore = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'power_consumption':
          result.powerConsumption = serializers.deserialize(value,
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

class _$PsrCategoryOptionsRecord extends PsrCategoryOptionsRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? psrGroup;
  @override
  final double? resilienceScore;
  @override
  final double? powerConsumption;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PsrCategoryOptionsRecord(
          [void Function(PsrCategoryOptionsRecordBuilder)? updates]) =>
      (new PsrCategoryOptionsRecordBuilder()..update(updates))._build();

  _$PsrCategoryOptionsRecord._(
      {this.name,
      this.psrGroup,
      this.resilienceScore,
      this.powerConsumption,
      this.ffRef})
      : super._();

  @override
  PsrCategoryOptionsRecord rebuild(
          void Function(PsrCategoryOptionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PsrCategoryOptionsRecordBuilder toBuilder() =>
      new PsrCategoryOptionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PsrCategoryOptionsRecord &&
        name == other.name &&
        psrGroup == other.psrGroup &&
        resilienceScore == other.resilienceScore &&
        powerConsumption == other.powerConsumption &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, psrGroup.hashCode);
    _$hash = $jc(_$hash, resilienceScore.hashCode);
    _$hash = $jc(_$hash, powerConsumption.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PsrCategoryOptionsRecord')
          ..add('name', name)
          ..add('psrGroup', psrGroup)
          ..add('resilienceScore', resilienceScore)
          ..add('powerConsumption', powerConsumption)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PsrCategoryOptionsRecordBuilder
    implements
        Builder<PsrCategoryOptionsRecord, PsrCategoryOptionsRecordBuilder> {
  _$PsrCategoryOptionsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _psrGroup;
  DocumentReference<Object?>? get psrGroup => _$this._psrGroup;
  set psrGroup(DocumentReference<Object?>? psrGroup) =>
      _$this._psrGroup = psrGroup;

  double? _resilienceScore;
  double? get resilienceScore => _$this._resilienceScore;
  set resilienceScore(double? resilienceScore) =>
      _$this._resilienceScore = resilienceScore;

  double? _powerConsumption;
  double? get powerConsumption => _$this._powerConsumption;
  set powerConsumption(double? powerConsumption) =>
      _$this._powerConsumption = powerConsumption;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PsrCategoryOptionsRecordBuilder() {
    PsrCategoryOptionsRecord._initializeBuilder(this);
  }

  PsrCategoryOptionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _psrGroup = $v.psrGroup;
      _resilienceScore = $v.resilienceScore;
      _powerConsumption = $v.powerConsumption;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PsrCategoryOptionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PsrCategoryOptionsRecord;
  }

  @override
  void update(void Function(PsrCategoryOptionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PsrCategoryOptionsRecord build() => _build();

  _$PsrCategoryOptionsRecord _build() {
    final _$result = _$v ??
        new _$PsrCategoryOptionsRecord._(
            name: name,
            psrGroup: psrGroup,
            resilienceScore: resilienceScore,
            powerConsumption: powerConsumption,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
