// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_depot_mapping_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StockDepotMappingRecord> _$stockDepotMappingRecordSerializer =
    new _$StockDepotMappingRecordSerializer();

class _$StockDepotMappingRecordSerializer
    implements StructuredSerializer<StockDepotMappingRecord> {
  @override
  final Iterable<Type> types = const [
    StockDepotMappingRecord,
    _$StockDepotMappingRecord
  ];
  @override
  final String wireName = 'StockDepotMappingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, StockDepotMappingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.responseItemName;
    if (value != null) {
      result
        ..add('response_item_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.depotName;
    if (value != null) {
      result
        ..add('depot_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberInStock;
    if (value != null) {
      result
        ..add('number_in_stock')
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
  StockDepotMappingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StockDepotMappingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'response_item_name':
          result.responseItemName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'depot_name':
          result.depotName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'number_in_stock':
          result.numberInStock = serializers.deserialize(value,
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

class _$StockDepotMappingRecord extends StockDepotMappingRecord {
  @override
  final String? responseItemName;
  @override
  final String? depotName;
  @override
  final int? numberInStock;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StockDepotMappingRecord(
          [void Function(StockDepotMappingRecordBuilder)? updates]) =>
      (new StockDepotMappingRecordBuilder()..update(updates))._build();

  _$StockDepotMappingRecord._(
      {this.responseItemName, this.depotName, this.numberInStock, this.ffRef})
      : super._();

  @override
  StockDepotMappingRecord rebuild(
          void Function(StockDepotMappingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockDepotMappingRecordBuilder toBuilder() =>
      new StockDepotMappingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockDepotMappingRecord &&
        responseItemName == other.responseItemName &&
        depotName == other.depotName &&
        numberInStock == other.numberInStock &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, responseItemName.hashCode);
    _$hash = $jc(_$hash, depotName.hashCode);
    _$hash = $jc(_$hash, numberInStock.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockDepotMappingRecord')
          ..add('responseItemName', responseItemName)
          ..add('depotName', depotName)
          ..add('numberInStock', numberInStock)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StockDepotMappingRecordBuilder
    implements
        Builder<StockDepotMappingRecord, StockDepotMappingRecordBuilder> {
  _$StockDepotMappingRecord? _$v;

  String? _responseItemName;
  String? get responseItemName => _$this._responseItemName;
  set responseItemName(String? responseItemName) =>
      _$this._responseItemName = responseItemName;

  String? _depotName;
  String? get depotName => _$this._depotName;
  set depotName(String? depotName) => _$this._depotName = depotName;

  int? _numberInStock;
  int? get numberInStock => _$this._numberInStock;
  set numberInStock(int? numberInStock) =>
      _$this._numberInStock = numberInStock;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StockDepotMappingRecordBuilder() {
    StockDepotMappingRecord._initializeBuilder(this);
  }

  StockDepotMappingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _responseItemName = $v.responseItemName;
      _depotName = $v.depotName;
      _numberInStock = $v.numberInStock;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockDepotMappingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StockDepotMappingRecord;
  }

  @override
  void update(void Function(StockDepotMappingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockDepotMappingRecord build() => _build();

  _$StockDepotMappingRecord _build() {
    final _$result = _$v ??
        new _$StockDepotMappingRecord._(
            responseItemName: responseItemName,
            depotName: depotName,
            numberInStock: numberInStock,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
