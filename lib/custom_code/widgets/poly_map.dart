// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class PolyMap extends StatefulWidget {
  const PolyMap({
    Key? key,
    this.width,
    this.height,
    required this.scenario,
    this.currentLocation,
    this.mapCenterLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference scenario;
  final LatLng? currentLocation;
  final LatLng? mapCenterLocation;

  @override
  _PolyMapState createState() => _PolyMapState();
}

class _PolyMapState extends State<PolyMap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
