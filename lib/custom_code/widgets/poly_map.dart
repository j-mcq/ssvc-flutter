// Automatic FlutterFlow imports
import 'package:google_fonts/google_fonts.dart';
import 'package:ssvc/components/enter_radius_widget.dart';
import 'package:ssvc/flutter_flow/flutter_flow_widgets.dart';

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
import 'package:maps_toolkit/maps_toolkit.dart' as mtk;

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
  final DocumentReference? scenario;
  final LatLng? currentLocation;
  final LatLng? mapCenterLocation;

  @override
  _PolyMapState createState() => _PolyMapState();
}

class _PolyMapState extends State<PolyMap> {
  final _unfocusNode = FocusNode();
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
  bool _isPolygon = true; // Default
  bool _isMarker = false;
  bool _isCircle = false;
  String _lastItemType = 'polygon'; // Default
  double _zoomLevel = 16; // Default

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
  }

  // Start the map with this marker setted up
  void _onMapCreated(gmf.GoogleMapController controller) {
    _googleMapController = controller;

    setState(() {
      _setMarkerIcon();
      _markers.add(
        gmf.Marker(
          markerId: gmf.MarkerId('0'),
          position: _getStartingMapLocation(),
          infoWindow: gmf.InfoWindow(
              title: 'Outage Loaction',
              snippet: 'Center of the outage location'),
          //icon: _markerIcon,
        ),
      );
    });
  }

  gmf.LatLng _getStartingMapLocation() {
    if (widget.mapCenterLocation != null) {
      return gmf.LatLng(widget.mapCenterLocation!.latitude,
          widget.mapCenterLocation!.longitude);
    }

    if (widget.currentLocation != null) {
      return gmf.LatLng(
          widget.currentLocation!.latitude, widget.currentLocation!.longitude);
    }
    // else retun center of SPEN location
    _zoomLevel = 10;
    return gmf.LatLng(53.178703, -2.994242);
  }

  // This function is to change the marker icon
  void _setMarkerIcon() async {
    _markerIcon = await gmf.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/farm.png');
  }

  void _loadData() async {
    if (widget.scenario != null) {
      final polygonPoints =
          await queryPolygonPointsRecordOnce(parent: widget.scenario!);
      final circles = await queryCirclesRecordOnce(parent: widget.scenario!);
// if there are polygonPoints then iterate through and add to _polygons
      if (polygonPoints.isNotEmpty) {
        polygonPoints.forEach((element) {
          polygonLatLngs.add(gmf.LatLng(element.latitude!, element.longitude!));
        });
        _setPolygon();
      }
      // if there are circles then iterate through and add to _circles
      if (circles.isNotEmpty) {
        circles.forEach((element) {
          _setCircles(gmf.LatLng(element.latitude!, element.longitude!));
        });
      }
    }
  }

  void _saveData() async {
    if (widget.scenario != null) {
      // for each point in polygonLatLngs save to the database
      polygonLatLngs.forEach((element) async {
        final polygonPointsRecordData = createPolygonPointsRecordData(
          latitude: element.latitude,
          longitude: element.longitude,
        );
        await PolygonPointsRecord.createDoc(widget.scenario!)
            .set(polygonPointsRecordData);
      });

      final polygonPoints =
          await queryPolygonPointsRecordOnce(parent: widget.scenario!);
      final circles = await queryCirclesRecordOnce(parent: widget.scenario!);
// if there are polygonPoints then iterate through and add to _polygons
      if (polygonPoints.isNotEmpty) {
        polygonPoints.forEach((element) {
          polygonLatLngs.add(gmf.LatLng(element.latitude!, element.longitude!));
        });
        _setPolygon();
      }
      // if there are circles then iterate through and add to _circles
      if (circles.isNotEmpty) {
        circles.forEach((element) {
          _setCircles(gmf.LatLng(element.latitude!, element.longitude!));
        });
      }
    }
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

      _markers.add(gmf.Marker(
        markerId: gmf.MarkerId(markerIdVal),
        position: point,
      ));
    });
  }

  // Remove last polygon point
  void _removeLastItemAdded() {
    setState(() {
      if (_lastItemType == 'polygon') {
        // Remove last polygon point
        if (polygonLatLngs.length > 0) {
          polygonLatLngs.removeLast();
        }
        // remove associated marker
        if (_markers.length > 0) {
          _markers.remove(_markers.last);
        }
      } else if (_lastItemType == 'circle') {
        if (_circles.length > 0) {
          _circles.remove(_circles.last);
        }
      }
    });
  }

  bool checkLocationIsInOutagArea(mtk.LatLng? propertyLocation) {
    // convert to maps_toolkit LatLng

    mtk.LatLng propertyLocationMtk = mtk.LatLng(
        _markers.first.position.latitude, _markers.first.position.longitude);

    propertyLocation = propertyLocationMtk;
    final polygonLatLngsMtk =
        polygonLatLngs.map((e) => mtk.LatLng(e.latitude, e.longitude)).toList();

    final isInPolygon = mtk.PolygonUtil.containsLocation(
        propertyLocation, polygonLatLngsMtk, true);
    return isInPolygon;
  }

  bool saveData(mtk.LatLng? propertyLocation) {
    // convert to maps_toolkit LatLng

    mtk.LatLng propertyLocationMtk = mtk.LatLng(
        _markers.first.position.latitude, _markers.first.position.longitude);

    propertyLocation = propertyLocationMtk;
    final polygonLatLngsMtk =
        polygonLatLngs.map((e) => mtk.LatLng(e.latitude, e.longitude)).toList();

    final isInPolygon = mtk.PolygonUtil.containsLocation(
        propertyLocation, polygonLatLngsMtk, true);
    return isInPolygon;
  }

  bool rayCastIntersect(LatLng tap, LatLng vertA, LatLng vertB) {
    double aY = vertA.latitude;
    double bY = vertB.latitude;
    double aX = vertA.longitude;
    double bX = vertB.longitude;
    double pY = tap.latitude;
    double pX = tap.longitude;

    if ((aY > pY && bY > pY) || (aY < pY && bY < pY) || (aX < pX && bX < pX)) {
      return false; // a and b can't both be above or below pt.y, and a or
      // b must be east of pt.x
    }

    double m = (aY - bY) / (aX - bX); // Rise over run
    double bee = (-aX) * m + aY; // y = mx + b
    double x = (pY - bee) / m; // algebra is neat!

    return x > pX;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 294,
              height: 500,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: gmf.GoogleMap(
                initialCameraPosition: gmf.CameraPosition(
                  target: _getStartingMapLocation(),
                  zoom: _zoomLevel,
                ),
                mapType: gmf.MapType.hybrid,
                markers: _markers,
                onMapCreated: _onMapCreated,
                circles: _circles,
                polygons: _polygons,
                myLocationEnabled: true,
                onTap: (point) {
                  if (_isPolygon) {
                    setState(() {
                      _lastItemType = 'polygon';
                      polygonLatLngs.add(point);
                      _setMarkers(point);
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
                      _lastItemType = 'circle';
                      _setCircles(point);
                    });
                  }
                },
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width - 294,
          height: 100,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    //Remove the last point setted at the polygon
                    _removeLastItemAdded();
                  },
                  text: 'Remove Last',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      enableDrag: false,
                      context: context,
                      builder: (bottomSheetContext) {
                        return GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).requestFocus(_unfocusNode),
                          child: Padding(
                            padding:
                                MediaQuery.of(bottomSheetContext).viewInsets,
                            child: EnterRadiusWidget(),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));

                    setState(() {
                      _isPolygon = false;
                      _isMarker = false;
                      _isCircle = true;
                      radius = FFAppState().impactRadius;
                    });
                  },
                  text: 'Add Circle',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      _isPolygon = true;
                      _isMarker = false;
                      _isCircle = false;
                    });
                  },
                  text: 'Add Polygon',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    checkLocationIsInOutagArea(null);
                  },
                  text: 'Calculate Response',
                  options: FFButtonOptions(
                    width: 160.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

    // Stack(
    //   children: <Widget>[
    //
    //     Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Row(
    //         children: <Widget>[
    //           ElevatedButton(
    //               onPressed: () {
    // _isPolygon = true;
    // _isMarker = false;
    // _isCircle = false;
    //               },
    //               child: Text(
    //                 'Polygon',
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold, color: Colors.white),
    //               )),
    //           ElevatedButton(
    //               onPressed: () {
    //                 _isPolygon = false;
    //                 _isMarker = true;
    //                 _isCircle = false;
    //               },
    //               child: Text('Marker',
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white))),
    //           ElevatedButton(
    //               onPressed: () async {
    //                 _isPolygon = false;
    //                 _isMarker = false;
    //                 _isCircle = true;
    //                 radius = 50;
    //                 await showDialog(
    //                     context: context,
    //                     builder: (alertDialogContext) {
    //                       return AlertDialog(
    //                         backgroundColor: Colors.grey[900],
    //                         title: Text(
    //                           'Enter the impact radius (m)',
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white),
    //                         ),
    //                         content: Padding(
    //                             padding: EdgeInsets.all(8),
    //                             child: Material(
    //                               color: Colors.black,
    //                               child: TextField(
    //                                 style: TextStyle(
    //                                     fontSize: 16, color: Colors.white),
    //                                 decoration: InputDecoration(
    //                                   hintText: 'Ex: 100',
    //                                   suffixText: 'meters',
    //                                 ),
    //                                 keyboardType:
    //                                     TextInputType.numberWithOptions(),
    //                                 onChanged: (input) {
    //                                   setState(() {
    //                                     radius = double.parse(input);
    //                                   });
    //                                 },
    //                               ),
    //                             )),
    //                         actions: [
    //                           TextButton(
    //                               onPressed: () => Navigator.pop(context),
    //                               child: Text(
    //                                 'Ok',
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.bold,
    //                                 ),
    //                               )),
    //                         ],
    //                       );
    //                     });
    //               },
    //               child: Text('Circle',
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white))),
    //         ],
    //       ),
    //     )
    //   ],
    // ));
  }
}
