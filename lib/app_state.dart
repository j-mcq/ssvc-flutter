import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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
