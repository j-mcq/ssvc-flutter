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
    value = object.outageDuration;
    if (value != null) {
      result
        ..add('outage_duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.mapCenterLocation;
    if (value != null) {
      result
        ..add('map_center_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.mapZoomLevel;
    if (value != null) {
      result
        ..add('map_zoom_level')
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
        case 'outage_duration':
          result.outageDuration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'map_center_location':
          result.mapCenterLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'map_zoom_level':
          result.mapZoomLevel = serializers.deserialize(value,
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

class _$ScenarioRecord extends ScenarioRecord {
  @override
  final String? name;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final double? outageDuration;
  @override
  final LatLng? mapCenterLocation;
  @override
  final double? mapZoomLevel;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScenarioRecord([void Function(ScenarioRecordBuilder)? updates]) =>
      (new ScenarioRecordBuilder()..update(updates))._build();

  _$ScenarioRecord._(
      {this.name,
      this.timestamp,
      this.createdBy,
      this.outageDuration,
      this.mapCenterLocation,
      this.mapZoomLevel,
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
        outageDuration == other.outageDuration &&
        mapCenterLocation == other.mapCenterLocation &&
        mapZoomLevel == other.mapZoomLevel &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, outageDuration.hashCode);
    _$hash = $jc(_$hash, mapCenterLocation.hashCode);
    _$hash = $jc(_$hash, mapZoomLevel.hashCode);
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
          ..add('outageDuration', outageDuration)
          ..add('mapCenterLocation', mapCenterLocation)
          ..add('mapZoomLevel', mapZoomLevel)
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

  double? _outageDuration;
  double? get outageDuration => _$this._outageDuration;
  set outageDuration(double? outageDuration) =>
      _$this._outageDuration = outageDuration;

  LatLng? _mapCenterLocation;
  LatLng? get mapCenterLocation => _$this._mapCenterLocation;
  set mapCenterLocation(LatLng? mapCenterLocation) =>
      _$this._mapCenterLocation = mapCenterLocation;

  double? _mapZoomLevel;
  double? get mapZoomLevel => _$this._mapZoomLevel;
  set mapZoomLevel(double? mapZoomLevel) => _$this._mapZoomLevel = mapZoomLevel;

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
      _outageDuration = $v.outageDuration;
      _mapCenterLocation = $v.mapCenterLocation;
      _mapZoomLevel = $v.mapZoomLevel;
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
            outageDuration: outageDuration,
            mapCenterLocation: mapCenterLocation,
            mapZoomLevel: mapZoomLevel,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
