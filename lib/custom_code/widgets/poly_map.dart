// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmf;
import 'dart:collection';

class PolyMap extends StatefulWidget {
  //PolyMap({Key key}) : super(key: key);

  PolyMap({
    Key? key,
    this.width,
    this.height,
    this.location,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? location;

  @override
  _PolyMapState createState() => _PolyMapState();
}

class _PolyMapState extends State<PolyMap> {
  // Location

  // Maps
  Set<gmf.Marker> _markers = HashSet<gmf.Marker>();
  Set<gmf.Polygon> _polygons = HashSet<gmf.Polygon>();
  Set<gmf.Circle> _circles = HashSet<gmf.Circle>();
  late gmf.GoogleMapController _googleMapController;
  late gmf.BitmapDescriptor _markerIcon;
  List<gmf.LatLng> polygonLatLngs = <gmf.LatLng>[];
  late double radius;

  //ids
  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  // Type controllers
  bool _isPolygon = true; //Default
  bool _isMarker = false;
  bool _isCircle = false;

  @override
  void initState() {
    super.initState();
  }

  // This function is to change the marker icon
  void _setMarkerIcon() async {
    _markerIcon = await gmf.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/farm.png');
  }

  // Draw Polygon to the map
  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(gmf.Polygon(
      polygonId: gmf.PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
  }

  // Set circles as points to the map
  void _setCircles(gmf.LatLng point) {
    final String circleIdVal = 'circle_id_$_circleIdCounter';
    _circleIdCounter++;
    print(
        'Circle | Latitude: ${point.latitude}  Longitude: ${point.longitude}  Radius: $radius');
    _circles.add(gmf.Circle(
        circleId: gmf.CircleId(circleIdVal),
        center: point,
        radius: radius,
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeWidth: 3,
        strokeColor: Colors.redAccent));
  }

  // Set Markers to the map
  void _setMarkers(gmf.LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      print(
          'Marker | Latitude: ${point.latitude}  Longitude: ${point.longitude}');
      _markers.add(
        gmf.Marker(
          markerId: gmf.MarkerId(markerIdVal),
          position: point,
        ),
      );
    });
  }

  // Start the map with this marker setted up
  void _onMapCreated(gmf.GoogleMapController controller) {
    _googleMapController = controller;

    setState(() {
      _markers.add(
        gmf.Marker(
          markerId: gmf.MarkerId('0'),
          position:
              gmf.LatLng(widget.location!.latitude, widget.location!.longitude),
          infoWindow: gmf.InfoWindow(
              title: 'Outage Loaction',
              snippet: 'Center of the outage location'),
          //icon: _markerIcon,
        ),
      );
    });
  }

  Widget _fabPolygon() {
    return FloatingActionButton.extended(
      onPressed: () {
        //Remove the last point setted at the polygon
        setState(() {
          polygonLatLngs.removeLast();
        });
      },
      icon: Icon(Icons.undo),
      label: Text('Undo point'),
      backgroundColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            polygonLatLngs.length > 0 && _isPolygon ? _fabPolygon() : null,
        body: Stack(
          children: <Widget>[
            gmf.GoogleMap(
              initialCameraPosition: gmf.CameraPosition(
                target: gmf.LatLng(
                    widget.location!.latitude, widget.location!.longitude),
                zoom: 16,
              ),
              mapType: gmf.MapType.hybrid,
              markers: _markers,
              circles: _circles,
              polygons: _polygons,
              myLocationEnabled: true,
              onTap: (point) {
                if (_isPolygon) {
                  setState(() {
                    polygonLatLngs.add(point);
                    _setPolygon();
                  });
                } else if (_isMarker) {
                  setState(() {
                    _markers.clear();
                    _setMarkers(point);
                  });
                } else if (_isCircle) {
                  setState(() {
                    _circles.clear();
                    _setCircles(point);
                  });
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        _isPolygon = true;
                        _isMarker = false;
                        _isCircle = false;
                      },
                      child: Text(
                        'Polygon',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _isPolygon = false;
                        _isMarker = true;
                        _isCircle = false;
                      },
                      child: Text('Marker',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  ElevatedButton(
                      onPressed: () async {
                        _isPolygon = false;
                        _isMarker = false;
                        _isCircle = true;
                        radius = 50;
                        await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: Text(
                                  'Enter the impact radius (m)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                content: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Material(
                                      color: Colors.black,
                                      child: TextField(
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: 'Ex: 100',
                                          suffixText: 'meters',
                                        ),
                                        keyboardType:
                                            TextInputType.numberWithOptions(),
                                        onChanged: (input) {
                                          setState(() {
                                            radius = double.parse(input);
                                          });
                                        },
                                      ),
                                    )),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Ok',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ],
                              );
                            });
                      },
                      child: Text('Circle',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
            )
          ],
        ));
  }
}
