import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActiveResponseItemsRecord extends FirestoreRecord {
  ActiveResponseItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_added" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "image_link" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  bool hasImageLink() => _imageLink != null;

  // "charging_status" field.
  double? _chargingStatus;
  double get chargingStatus => _chargingStatus ?? 0.0;
  bool hasChargingStatus() => _chargingStatus != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "status_description" field.
  String? _statusDescription;
  String get statusDescription => _statusDescription ?? '';
  bool hasStatusDescription() => _statusDescription != null;

  // "home_depot_name" field.
  String? _homeDepotName;
  String get homeDepotName => _homeDepotName ?? '';
  bool hasHomeDepotName() => _homeDepotName != null;

  // "response_item_name" field.
  String? _responseItemName;
  String get responseItemName => _responseItemName ?? '';
  bool hasResponseItemName() => _responseItemName != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "status_reference" field.
  String? _statusReference;
  String get statusReference => _statusReference ?? '';
  bool hasStatusReference() => _statusReference != null;

  // "response_item_reference" field.
  String? _responseItemReference;
  String get responseItemReference => _responseItemReference ?? '';
  bool hasResponseItemReference() => _responseItemReference != null;

  // "depot_reference" field.
  String? _depotReference;
  String get depotReference => _depotReference ?? '';
  bool hasDepotReference() => _depotReference != null;

  void _initializeFields() {
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _imageLink = snapshotData['image_link'] as String?;
    _chargingStatus = castToType<double>(snapshotData['charging_status']);
    _location = snapshotData['location'] as LatLng?;
    _statusDescription = snapshotData['status_description'] as String?;
    _homeDepotName = snapshotData['home_depot_name'] as String?;
    _responseItemName = snapshotData['response_item_name'] as String?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _statusReference = snapshotData['status_reference'] as String?;
    _responseItemReference = snapshotData['response_item_reference'] as String?;
    _depotReference = snapshotData['depot_reference'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('active_response_items');

  static Stream<ActiveResponseItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActiveResponseItemsRecord.fromSnapshot(s));

  static Future<ActiveResponseItemsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActiveResponseItemsRecord.fromSnapshot(s));

  static ActiveResponseItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActiveResponseItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActiveResponseItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActiveResponseItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActiveResponseItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActiveResponseItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActiveResponseItemsRecordData({
  DateTime? dateAdded,
  String? imageLink,
  double? chargingStatus,
  LatLng? location,
  String? statusDescription,
  String? homeDepotName,
  String? responseItemName,
  bool? isAvailable,
  String? statusReference,
  String? responseItemReference,
  String? depotReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_added': dateAdded,
      'image_link': imageLink,
      'charging_status': chargingStatus,
      'location': location,
      'status_description': statusDescription,
      'home_depot_name': homeDepotName,
      'response_item_name': responseItemName,
      'isAvailable': isAvailable,
      'status_reference': statusReference,
      'response_item_reference': responseItemReference,
      'depot_reference': depotReference,
    }.withoutNulls,
  );

  return firestoreData;
}
