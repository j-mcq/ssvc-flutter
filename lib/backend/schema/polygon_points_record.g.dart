// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_points_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PolygonPointsRecord> _$polygonPointsRecordSerializer =
    new _$PolygonPointsRecordSerializer();

class _$PolygonPointsRecordSerializer
    implements StructuredSerializer<PolygonPointsRecord> {
  @override
  final Iterable<Type> types = const [
    PolygonPointsRecord,
    _$PolygonPointsRecord
  ];
  @override
  final String wireName = 'PolygonPointsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PolygonPointsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.latitude;
    if (value != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.longitude;
    if (value != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.index;
    if (value != null) {
      result
        ..add('index')
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
  PolygonPointsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PolygonPointsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
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

class _$PolygonPointsRecord extends PolygonPointsRecord {
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? index;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PolygonPointsRecord(
          [void Function(PolygonPointsRecordBuilder)? updates]) =>
      (new PolygonPointsRecordBuilder()..update(updates))._build();

  _$PolygonPointsRecord._(
      {this.latitude, this.longitude, this.index, this.ffRef})
      : super._();

  @override
  PolygonPointsRecord rebuild(
          void Function(PolygonPointsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PolygonPointsRecordBuilder toBuilder() =>
      new PolygonPointsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PolygonPointsRecord &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        index == other.index &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PolygonPointsRecord')
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('index', index)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PolygonPointsRecordBuilder
    implements Builder<PolygonPointsRecord, PolygonPointsRecordBuilder> {
  _$PolygonPointsRecord? _$v;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PolygonPointsRecordBuilder() {
    PolygonPointsRecord._initializeBuilder(this);
  }

  PolygonPointsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _index = $v.index;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PolygonPointsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PolygonPointsRecord;
  }

  @override
  void update(void Function(PolygonPointsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PolygonPointsRecord build() => _build();

  _$PolygonPointsRecord _build() {
    final _$result = _$v ??
        new _$PolygonPointsRecord._(
            latitude: latitude,
            longitude: longitude,
            index: index,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
