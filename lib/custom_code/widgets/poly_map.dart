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
    this.location,
    this.isPolygon,
    this.isCircle,
    this.polygon,
    this.circle,
    this.radius,
    this.scenario,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? location;
  final bool? isPolygon;
  final bool? isCircle;
  final String? polygon;
  final String? circle;
  final double? radius;
  final DocumentReference? scenario;

  @override
  _PolyMapState createState() => _PolyMapState();
}

class _PolyMapState extends State<PolyMap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
