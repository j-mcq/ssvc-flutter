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

  // "response_item" field.
  DocumentReference? _responseItem;
  DocumentReference? get responseItem => _responseItem;
  bool hasResponseItem() => _responseItem != null;

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

  // "home_depot" field.
  DocumentReference? _homeDepot;
  DocumentReference? get homeDepot => _homeDepot;
  bool hasHomeDepot() => _homeDepot != null;

  // "home_depot_name" field.
  String? _homeDepotName;
  String get homeDepotName => _homeDepotName ?? '';
  bool hasHomeDepotName() => _homeDepotName != null;

  // "response_item_name" field.
  String? _responseItemName;
  String get responseItemName => _responseItemName ?? '';
  bool hasResponseItemName() => _responseItemName != null;

  // "status" field.
  DocumentReference? _status;
  DocumentReference? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _imageLink = snapshotData['image_link'] as String?;
    _responseItem = snapshotData['response_item'] as DocumentReference?;
    _chargingStatus = castToType<double>(snapshotData['charging_status']);
    _location = snapshotData['location'] as LatLng?;
    _statusDescription = snapshotData['status_description'] as String?;
    _homeDepot = snapshotData['home_depot'] as DocumentReference?;
    _homeDepotName = snapshotData['home_depot_name'] as String?;
    _responseItemName = snapshotData['response_item_name'] as String?;
    _status = snapshotData['status'] as DocumentReference?;
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
}

Map<String, dynamic> createActiveResponseItemsRecordData({
  DateTime? dateAdded,
  String? imageLink,
  DocumentReference? responseItem,
  double? chargingStatus,
  LatLng? location,
  String? statusDescription,
  DocumentReference? homeDepot,
  String? homeDepotName,
  String? responseItemName,
  DocumentReference? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_added': dateAdded,
      'image_link': imageLink,
      'response_item': responseItem,
      'charging_status': chargingStatus,
      'location': location,
      'status_description': statusDescription,
      'home_depot': homeDepot,
      'home_depot_name': homeDepotName,
      'response_item_name': responseItemName,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}
