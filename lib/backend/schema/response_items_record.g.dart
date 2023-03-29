// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_items_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseItemsRecord> _$responseItemsRecordSerializer =
    new _$ResponseItemsRecordSerializer();

class _$ResponseItemsRecordSerializer
    implements StructuredSerializer<ResponseItemsRecord> {
  @override
  final Iterable<Type> types = const [
    ResponseItemsRecord,
    _$ResponseItemsRecord
  ];
  @override
  final String wireName = 'ResponseItemsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResponseItemsRecord object,
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateAdded;
    if (value != null) {
      result
        ..add('date_added')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.imageLink;
    if (value != null) {
      result
        ..add('image_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unitPrice;
    if (value != null) {
      result
        ..add('unit_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.stock;
    if (value != null) {
      result
        ..add('stock')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.depot;
    if (value != null) {
      result
        ..add('depot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.depotName;
    if (value != null) {
      result
        ..add('depot_name')
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
  ResponseItemsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseItemsRecordBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_added':
          result.dateAdded = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'image_link':
          result.imageLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'unit_price':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'stock':
          result.stock = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'depot':
          result.depot = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'depot_name':
          result.depotName = serializers.deserialize(value,
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

class _$ResponseItemsRecord extends ResponseItemsRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? dateAdded;
  @override
  final String? imageLink;
  @override
  final double? unitPrice;
  @override
  final double? stock;
  @override
  final DocumentReference<Object?>? depot;
  @override
  final String? depotName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ResponseItemsRecord(
          [void Function(ResponseItemsRecordBuilder)? updates]) =>
      (new ResponseItemsRecordBuilder()..update(updates))._build();

  _$ResponseItemsRecord._(
      {this.name,
      this.description,
      this.dateAdded,
      this.imageLink,
      this.unitPrice,
      this.stock,
      this.depot,
      this.depotName,
      this.ffRef})
      : super._();

  @override
  ResponseItemsRecord rebuild(
          void Function(ResponseItemsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseItemsRecordBuilder toBuilder() =>
      new ResponseItemsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseItemsRecord &&
        name == other.name &&
        description == other.description &&
        dateAdded == other.dateAdded &&
        imageLink == other.imageLink &&
        unitPrice == other.unitPrice &&
        stock == other.stock &&
        depot == other.depot &&
        depotName == other.depotName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, dateAdded.hashCode);
    _$hash = $jc(_$hash, imageLink.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jc(_$hash, stock.hashCode);
    _$hash = $jc(_$hash, depot.hashCode);
    _$hash = $jc(_$hash, depotName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseItemsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('dateAdded', dateAdded)
          ..add('imageLink', imageLink)
          ..add('unitPrice', unitPrice)
          ..add('stock', stock)
          ..add('depot', depot)
          ..add('depotName', depotName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ResponseItemsRecordBuilder
    implements Builder<ResponseItemsRecord, ResponseItemsRecordBuilder> {
  _$ResponseItemsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _dateAdded;
  DateTime? get dateAdded => _$this._dateAdded;
  set dateAdded(DateTime? dateAdded) => _$this._dateAdded = dateAdded;

  String? _imageLink;
  String? get imageLink => _$this._imageLink;
  set imageLink(String? imageLink) => _$this._imageLink = imageLink;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  double? _stock;
  double? get stock => _$this._stock;
  set stock(double? stock) => _$this._stock = stock;

  DocumentReference<Object?>? _depot;
  DocumentReference<Object?>? get depot => _$this._depot;
  set depot(DocumentReference<Object?>? depot) => _$this._depot = depot;

  String? _depotName;
  String? get depotName => _$this._depotName;
  set depotName(String? depotName) => _$this._depotName = depotName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ResponseItemsRecordBuilder() {
    ResponseItemsRecord._initializeBuilder(this);
  }

  ResponseItemsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _dateAdded = $v.dateAdded;
      _imageLink = $v.imageLink;
      _unitPrice = $v.unitPrice;
      _stock = $v.stock;
      _depot = $v.depot;
      _depotName = $v.depotName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseItemsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseItemsRecord;
  }

  @override
  void update(void Function(ResponseItemsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseItemsRecord build() => _build();

  _$ResponseItemsRecord _build() {
    final _$result = _$v ??
        new _$ResponseItemsRecord._(
            name: name,
            description: description,
            dateAdded: dateAdded,
            imageLink: imageLink,
            unitPrice: unitPrice,
            stock: stock,
            depot: depot,
            depotName: depotName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
