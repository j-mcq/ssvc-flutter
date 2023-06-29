// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PolygonListStruct extends FFFirebaseStruct {
  PolygonListStruct({
    List<LatLng>? polygonLatLngs,
    int? polygonIndex,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _polygonLatLngs = polygonLatLngs,
        _polygonIndex = polygonIndex,
        super(firestoreUtilData);

  // "polygonLatLngs" field.
  List<LatLng>? _polygonLatLngs;
  List<LatLng> get polygonLatLngs => _polygonLatLngs ?? const [];
  set polygonLatLngs(List<LatLng>? val) => _polygonLatLngs = val;
  void updatePolygonLatLngs(Function(List<LatLng>) updateFn) =>
      updateFn(_polygonLatLngs ??= []);
  bool hasPolygonLatLngs() => _polygonLatLngs != null;

  // "polygonIndex" field.
  int? _polygonIndex;
  int get polygonIndex => _polygonIndex ?? 0;
  set polygonIndex(int? val) => _polygonIndex = val;
  void incrementPolygonIndex(int amount) =>
      _polygonIndex = polygonIndex + amount;
  bool hasPolygonIndex() => _polygonIndex != null;

  static PolygonListStruct fromMap(Map<String, dynamic> data) =>
      PolygonListStruct(
        polygonLatLngs: getDataList(data['polygonLatLngs']),
        polygonIndex: castToType<int>(data['polygonIndex']),
      );

  static PolygonListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PolygonListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'polygonLatLngs': _polygonLatLngs,
        'polygonIndex': _polygonIndex,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'polygonLatLngs': serializeParam(
          _polygonLatLngs,
          ParamType.LatLng,
          true,
        ),
        'polygonIndex': serializeParam(
          _polygonIndex,
          ParamType.int,
        ),
      }.withoutNulls;

  static PolygonListStruct fromSerializableMap(Map<String, dynamic> data) =>
      PolygonListStruct(
        polygonLatLngs: deserializeParam<LatLng>(
          data['polygonLatLngs'],
          ParamType.LatLng,
          true,
        ),
        polygonIndex: deserializeParam(
          data['polygonIndex'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PolygonListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PolygonListStruct &&
        listEquality.equals(polygonLatLngs, other.polygonLatLngs) &&
        polygonIndex == other.polygonIndex;
  }

  @override
  int get hashCode => const ListEquality().hash([polygonLatLngs, polygonIndex]);
}

PolygonListStruct createPolygonListStruct({
  int? polygonIndex,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PolygonListStruct(
      polygonIndex: polygonIndex,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PolygonListStruct? updatePolygonListStruct(
  PolygonListStruct? polygonList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    polygonList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPolygonListStructData(
  Map<String, dynamic> firestoreData,
  PolygonListStruct? polygonList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (polygonList == null) {
    return;
  }
  if (polygonList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && polygonList.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final polygonListData =
      getPolygonListFirestoreData(polygonList, forFieldValue);
  final nestedData =
      polygonListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = polygonList.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPolygonListFirestoreData(
  PolygonListStruct? polygonList, [
  bool forFieldValue = false,
]) {
  if (polygonList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(polygonList.toMap());

  // Add any Firestore field values
  polygonList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPolygonListListFirestoreData(
  List<PolygonListStruct>? polygonLists,
) =>
    polygonLists?.map((e) => getPolygonListFirestoreData(e, true)).toList() ??
    [];
