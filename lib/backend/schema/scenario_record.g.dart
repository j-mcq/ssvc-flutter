// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScenarioRecord> _$scenarioRecordSerializer =
    new _$ScenarioRecordSerializer();

class _$ScenarioRecordSerializer
    implements StructuredSerializer<ScenarioRecord> {
  @override
  final Iterable<Type> types = const [ScenarioRecord, _$ScenarioRecord];
  @override
  final String wireName = 'ScenarioRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScenarioRecord object,
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
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.propertiesImpacted;
    if (value != null) {
      result
        ..add('properties_impacted')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.outageDuration;
    if (value != null) {
      result
        ..add('outage_duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.percentageCoverered;
    if (value != null) {
      result
        ..add('percentage_coverered')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.locationName;
    if (value != null) {
      result
        ..add('location_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
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
  ScenarioRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScenarioRecordBuilder();

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
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'properties_impacted':
          result.propertiesImpacted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'outage_duration':
          result.outageDuration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'percentage_coverered':
          result.percentageCoverered = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'location_name':
          result.locationName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
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

class _$ScenarioRecord extends ScenarioRecord {
  @override
  final String? name;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final int? propertiesImpacted;
  @override
  final double? outageDuration;
  @override
  final double? percentageCoverered;
  @override
  final String? locationName;
  @override
  final LatLng? location;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioRecord([void Function(ScenarioRecordBuilder)? updates]) =>
      (new ScenarioRecordBuilder()..update(updates))._build();

  _$ScenarioRecord._(
      {this.name,
      this.timestamp,
      this.createdBy,
      this.propertiesImpacted,
      this.outageDuration,
      this.percentageCoverered,
      this.locationName,
      this.location,
      this.ffRef})
      : super._();

  @override
  ScenarioRecord rebuild(void Function(ScenarioRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScenarioRecordBuilder toBuilder() =>
      new ScenarioRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScenarioRecord &&
        name == other.name &&
        timestamp == other.timestamp &&
        createdBy == other.createdBy &&
        propertiesImpacted == other.propertiesImpacted &&
        outageDuration == other.outageDuration &&
        percentageCoverered == other.percentageCoverered &&
        locationName == other.locationName &&
        location == other.location &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, propertiesImpacted.hashCode);
    _$hash = $jc(_$hash, outageDuration.hashCode);
    _$hash = $jc(_$hash, percentageCoverered.hashCode);
    _$hash = $jc(_$hash, locationName.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScenarioRecord')
          ..add('name', name)
          ..add('timestamp', timestamp)
          ..add('createdBy', createdBy)
          ..add('propertiesImpacted', propertiesImpacted)
          ..add('outageDuration', outageDuration)
          ..add('percentageCoverered', percentageCoverered)
          ..add('locationName', locationName)
          ..add('location', location)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScenarioRecordBuilder
    implements Builder<ScenarioRecord, ScenarioRecordBuilder> {
  _$ScenarioRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  int? _propertiesImpacted;
  int? get propertiesImpacted => _$this._propertiesImpacted;
  set propertiesImpacted(int? propertiesImpacted) =>
      _$this._propertiesImpacted = propertiesImpacted;

  double? _outageDuration;
  double? get outageDuration => _$this._outageDuration;
  set outageDuration(double? outageDuration) =>
      _$this._outageDuration = outageDuration;

  double? _percentageCoverered;
  double? get percentageCoverered => _$this._percentageCoverered;
  set percentageCoverered(double? percentageCoverered) =>
      _$this._percentageCoverered = percentageCoverered;

  String? _locationName;
  String? get locationName => _$this._locationName;
  set locationName(String? locationName) => _$this._locationName = locationName;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScenarioRecordBuilder() {
    ScenarioRecord._initializeBuilder(this);
  }

  ScenarioRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _timestamp = $v.timestamp;
      _createdBy = $v.createdBy;
      _propertiesImpacted = $v.propertiesImpacted;
      _outageDuration = $v.outageDuration;
      _percentageCoverered = $v.percentageCoverered;
      _locationName = $v.locationName;
      _location = $v.location;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScenarioRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScenarioRecord;
  }

  @override
  void update(void Function(ScenarioRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScenarioRecord build() => _build();

  _$ScenarioRecord _build() {
    final _$result = _$v ??
        new _$ScenarioRecord._(
            name: name,
            timestamp: timestamp,
            createdBy: createdBy,
            propertiesImpacted: propertiesImpacted,
            outageDuration: outageDuration,
            percentageCoverered: percentageCoverered,
            locationName: locationName,
            location: location,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
