// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CirclesRecord> _$circlesRecordSerializer =
    new _$CirclesRecordSerializer();

class _$CirclesRecordSerializer implements StructuredSerializer<CirclesRecord> {
  @override
  final Iterable<Type> types = const [CirclesRecord, _$CirclesRecord];
  @override
  final String wireName = 'CirclesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CirclesRecord object,
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
    value = object.radius;
    if (value != null) {
      result
        ..add('radius')
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
  CirclesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CirclesRecordBuilder();

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
        case 'radius':
          result.radius = serializers.deserialize(value,
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

class _$CirclesRecord extends CirclesRecord {
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? radius;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CirclesRecord([void Function(CirclesRecordBuilder)? updates]) =>
      (new CirclesRecordBuilder()..update(updates))._build();

  _$CirclesRecord._({this.latitude, this.longitude, this.radius, this.ffRef})
      : super._();

  @override
  CirclesRecord rebuild(void Function(CirclesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CirclesRecordBuilder toBuilder() => new CirclesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CirclesRecord &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        radius == other.radius &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, radius.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CirclesRecord')
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('radius', radius)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CirclesRecordBuilder
    implements Builder<CirclesRecord, CirclesRecordBuilder> {
  _$CirclesRecord? _$v;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _radius;
  double? get radius => _$this._radius;
  set radius(double? radius) => _$this._radius = radius;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CirclesRecordBuilder() {
    CirclesRecord._initializeBuilder(this);
  }

  CirclesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _radius = $v.radius;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CirclesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CirclesRecord;
  }

  @override
  void update(void Function(CirclesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CirclesRecord build() => _build();

  _$CirclesRecord _build() {
    final _$result = _$v ??
        new _$CirclesRecord._(
            latitude: latitude,
            longitude: longitude,
            radius: radius,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
