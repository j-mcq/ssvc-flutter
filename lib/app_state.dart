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

  String _savingMessage = '';
  String get savingMessage => _savingMessage;
  set savingMessage(String _value) {
    _savingMessage = _value;
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
