import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _impactRadius = 25;
  double get impactRadius => _impactRadius;
  set impactRadius(double _value) {
    _impactRadius = _value;
  }

  bool _isSaving = false;
  bool get isSaving => _isSaving;
  set isSaving(bool _value) {
    _isSaving = _value;
  }

  List<LatLng> _polygonLatLngList = [];
  List<LatLng> get polygonLatLngList => _polygonLatLngList;
  set polygonLatLngList(List<LatLng> _value) {
    _polygonLatLngList = _value;
  }

  void addToPolygonLatLngList(LatLng _value) {
    _polygonLatLngList.add(_value);
  }

  void removeFromPolygonLatLngList(LatLng _value) {
    _polygonLatLngList.remove(_value);
  }

  void removeAtIndexFromPolygonLatLngList(int _index) {
    _polygonLatLngList.removeAt(_index);
  }

  void updatePolygonLatLngListAtIndex(
    int _index,
    LatLng Function(LatLng) updateFn,
  ) {
    _polygonLatLngList[_index] = updateFn(_polygonLatLngList[_index]);
  }

  double _circleRadius = 0.0;
  double get circleRadius => _circleRadius;
  set circleRadius(double _value) {
    _circleRadius = _value;
  }

  LatLng? _circleLatLng;
  LatLng? get circleLatLng => _circleLatLng;
  set circleLatLng(LatLng? _value) {
    _circleLatLng = _value;
  }

  DocumentReference? _scenarioReference;
  DocumentReference? get scenarioReference => _scenarioReference;
  set scenarioReference(DocumentReference? _value) {
    _scenarioReference = _value;
  }

  LatLng? _mapCenterLocation;
  LatLng? get mapCenterLocation => _mapCenterLocation;
  set mapCenterLocation(LatLng? _value) {
    _mapCenterLocation = _value;
  }

  double _mapZoomLevel = 16;
  double get mapZoomLevel => _mapZoomLevel;
  set mapZoomLevel(double _value) {
    _mapZoomLevel = _value;
  }

  String _defautImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ssvc-v039x3/assets/sw0fdnvp3hmh/download.png';
  String get defautImage => _defautImage;
  set defautImage(String _value) {
    _defautImage = _value;
  }

  List<PolygonListStruct> _polygonList = [];
  List<PolygonListStruct> get polygonList => _polygonList;
  set polygonList(List<PolygonListStruct> _value) {
    _polygonList = _value;
  }

  void addToPolygonList(PolygonListStruct _value) {
    _polygonList.add(_value);
  }

  void removeFromPolygonList(PolygonListStruct _value) {
    _polygonList.remove(_value);
  }

  void removeAtIndexFromPolygonList(int _index) {
    _polygonList.removeAt(_index);
  }

  void updatePolygonListAtIndex(
    int _index,
    PolygonListStruct Function(PolygonListStruct) updateFn,
  ) {
    _polygonList[_index] = updateFn(_polygonList[_index]);
  }

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool _value) {
    _isEditing = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
