import 'dart:async';

import 'package:collection/collection.dart';

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

  // "status" field.
  DocumentReference? _status;
  DocumentReference? get status => _status;
  bool hasStatus() => _status != null;

  // "response_item" field.
  DocumentReference? _responseItem;
  DocumentReference? get responseItem => _responseItem;
  bool hasResponseItem() => _responseItem != null;

  // "home_depot" field.
  DocumentReference? _homeDepot;
  DocumentReference? get homeDepot => _homeDepot;
  bool hasHomeDepot() => _homeDepot != null;

  // "owners" field.
  List<DocumentReference>? _owners;
  List<DocumentReference> get owners => _owners ?? const [];
  bool hasOwners() => _owners != null;

  void _initializeFields() {
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _imageLink = snapshotData['image_link'] as String?;
    _chargingStatus = castToType<double>(snapshotData['charging_status']);
    _location = snapshotData['location'] as LatLng?;
    _statusDescription = snapshotData['status_description'] as String?;
    _homeDepotName = snapshotData['home_depot_name'] as String?;
    _responseItemName = snapshotData['response_item_name'] as String?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _status = snapshotData['status'] as DocumentReference?;
    _responseItem = snapshotData['response_item'] as DocumentReference?;
    _homeDepot = snapshotData['home_depot'] as DocumentReference?;
    _owners = getDataList(snapshotData['owners']);
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
  DocumentReference? status,
  DocumentReference? responseItem,
  DocumentReference? homeDepot,
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
      'status': status,
      'response_item': responseItem,
      'home_depot': homeDepot,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActiveResponseItemsRecordDocumentEquality
    implements Equality<ActiveResponseItemsRecord> {
  const ActiveResponseItemsRecordDocumentEquality();

  @override
  bool equals(ActiveResponseItemsRecord? e1, ActiveResponseItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateAdded == e2?.dateAdded &&
        e1?.imageLink == e2?.imageLink &&
        e1?.chargingStatus == e2?.chargingStatus &&
        e1?.location == e2?.location &&
        e1?.statusDescription == e2?.statusDescription &&
        e1?.homeDepotName == e2?.homeDepotName &&
        e1?.responseItemName == e2?.responseItemName &&
        e1?.isAvailable == e2?.isAvailable &&
        e1?.status == e2?.status &&
        e1?.responseItem == e2?.responseItem &&
        e1?.homeDepot == e2?.homeDepot &&
        listEquality.equals(e1?.owners, e2?.owners);
  }

  @override
  int hash(ActiveResponseItemsRecord? e) => const ListEquality().hash([
        e?.dateAdded,
        e?.imageLink,
        e?.chargingStatus,
        e?.location,
        e?.statusDescription,
        e?.homeDepotName,
        e?.responseItemName,
        e?.isAvailable,
        e?.status,
        e?.responseItem,
        e?.homeDepot,
        e?.owners
      ]);

  @override
  bool isValidKey(Object? o) => o is ActiveResponseItemsRecord;
}
