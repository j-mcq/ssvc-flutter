// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psr_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PsrRecord> _$psrRecordSerializer = new _$PsrRecordSerializer();

class _$PsrRecordSerializer implements StructuredSerializer<PsrRecord> {
  @override
  final Iterable<Type> types = const [PsrRecord, _$PsrRecord];
  @override
  final String wireName = 'PsrRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PsrRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.address1;
    if (value != null) {
      result
        ..add('address1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address2;
    if (value != null) {
      result
        ..add('address2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postcode;
    if (value != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lattitude;
    if (value != null) {
      result
        ..add('lattitude')
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
  PsrRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PsrRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address1':
          result.address1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address2':
          result.address2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lattitude':
          result.lattitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
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

class _$PsrRecord extends PsrRecord {
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? postcode;
  @override
  final double? lattitude;
  @override
  final double? longitude;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PsrRecord([void Function(PsrRecordBuilder)? updates]) =>
      (new PsrRecordBuilder()..update(updates))._build();

  _$PsrRecord._(
      {this.address1,
      this.address2,
      this.postcode,
      this.lattitude,
      this.longitude,
      this.ffRef})
      : super._();

  @override
  PsrRecord rebuild(void Function(PsrRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PsrRecordBuilder toBuilder() => new PsrRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PsrRecord &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        postcode == other.postcode &&
        lattitude == other.lattitude &&
        longitude == other.longitude &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address1.hashCode);
    _$hash = $jc(_$hash, address2.hashCode);
    _$hash = $jc(_$hash, postcode.hashCode);
    _$hash = $jc(_$hash, lattitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PsrRecord')
          ..add('address1', address1)
          ..add('address2', address2)
          ..add('postcode', postcode)
          ..add('lattitude', lattitude)
          ..add('longitude', longitude)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PsrRecordBuilder implements Builder<PsrRecord, PsrRecordBuilder> {
  _$PsrRecord? _$v;

  String? _address1;
  String? get address1 => _$this._address1;
  set address1(String? address1) => _$this._address1 = address1;

  String? _address2;
  String? get address2 => _$this._address2;
  set address2(String? address2) => _$this._address2 = address2;

  String? _postcode;
  String? get postcode => _$this._postcode;
  set postcode(String? postcode) => _$this._postcode = postcode;

  double? _lattitude;
  double? get lattitude => _$this._lattitude;
  set lattitude(double? lattitude) => _$this._lattitude = lattitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PsrRecordBuilder() {
    PsrRecord._initializeBuilder(this);
  }

  PsrRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address1 = $v.address1;
      _address2 = $v.address2;
      _postcode = $v.postcode;
      _lattitude = $v.lattitude;
      _longitude = $v.longitude;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PsrRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PsrRecord;
  }

  @override
  void update(void Function(PsrRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PsrRecord build() => _build();

  _$PsrRecord _build() {
    final _$result = _$v ??
        new _$PsrRecord._(
            address1: address1,
            address2: address2,
            postcode: postcode,
            lattitude: lattitude,
            longitude: longitude,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
