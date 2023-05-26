/// Automatic FlutterFlow imports
import 'package:google_fonts/google_fonts.dart';
import 'package:ssvc/components/enter_radius_widget.dart';
import 'package:ssvc/flutter_flow/flutter_flow_google_map.dart';
import 'package:ssvc/flutter_flow/flutter_flow_widgets.dart';
import 'package:ssvc/scenario/scenario_model.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmf;
import 'dart:collection';
//import 'package:maps_toolkit/maps_toolkit.dart' as mtk;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PolyMap extends StatefulWidget {
  const PolyMap({
    Key? key,
    this.width,
    this.height,
    this.scenario,
    this.currentLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? scenario;
  final LatLng? currentLocation;

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
  List<PolygonLatLng> polygonLatLngs = <PolygonLatLng>[];
  late double radius;

  //ids
  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  // Type controllers
  bool _isPolygon = true; // Default
  bool _isMarker = false;
  bool _isCircle = false;
  bool _isDataLoaded = false;
  String _lastItemType = 'polygon'; // Default
  bool _showPsrHouseholds = true;
  double _zoomLevel = 10; // Default
  gmf.LatLng _map_center_location = gmf.LatLng(53.178703, -2.994242);

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

    setState(() async {
      _loadMapData();
      _setMarkerIcon();
    });
  }

  Future<bool> _getStartingMapLocation() async {
    if (widget.scenario != null) {
      final scenarioRecord =
          await ScenarioRecord.getDocumentOnce(widget.scenario!);

      if (scenarioRecord.mapCenterLocation != null) {
        _map_center_location = gmf.LatLng(
            scenarioRecord.mapCenterLocation!.latitude,
            scenarioRecord.mapCenterLocation!.longitude);
      }
      if (scenarioRecord.mapZoomLevel > 0) {
        _zoomLevel = scenarioRecord.mapZoomLevel;
      }
    } else if (widget.currentLocation != null) {
      _map_center_location = gmf.LatLng(
          widget.currentLocation!.latitude, widget.currentLocation!.longitude);
    }
    if (_polygons.length == 0 && _circles.length == 0) {
      await _loadMapData();
    }
    return true;
  }

  // This function is to change the marker icon
  void _setMarkerIcon() async {
    _markerIcon = await gmf.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/farm.png');
  }

  _clearAppState() {
    FFAppState().circleLatLng = null;
    FFAppState().circleRadius = 0.0;
    FFAppState().polygonLatLngList.clear();

    FFAppState().mapCenterLocation = null;
    FFAppState().mapZoomLevel = _zoomLevel;
  }

  Future<void> _loadMapData() async {
    _clearAppState();
    if (_isDataLoaded == false) {
      if (widget.scenario != null) {
        final polygonPoints = await queryPolygonPointsRecordOnce(
            parent: widget.scenario!,
            queryBuilder: (query) => query.orderBy('index'));
        final circles = await queryCirclesRecordOnce(parent: widget.scenario!);

        // if there are polygonPoints then iterate through and add to _polygons
        if (polygonPoints.isNotEmpty) {
          polygonPoints.forEach((element) {
            // create a new polyLatLng and add to the list
            polygonLatLngs.add(PolygonLatLng(
                latLng: gmf.LatLng(element.latitude!, element.longitude!),
                polygonReference: element.reference));
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
      if (_showPsrHouseholds) {
        final psrHouseholds = await queryPsrRecordOnce();

        for (var psrHousehold in psrHouseholds) {
          _setMarkers(
              gmf.LatLng(psrHousehold.latitude!, psrHousehold.longitude!));
        }
      }
    }
    _isDataLoaded = true;
  }

  // Draw Polygon to the map
  void _setPolygon() {
    if (_polygons.length == 0) {
      final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
      _polygons.add(gmf.Polygon(
        polygonId: gmf.PolygonId(polygonIdVal),
        points: polygonLatLngs.map((e) => e.latLng).toList(),
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ));
    } else {
      _polygons.first.points.clear();
      _polygons.first.points
          .addAll(polygonLatLngs.map((e) => e.latLng).toList());

      FFAppState().polygonLatLngList.clear();
    }
    FFAppState().polygonLatLngList.addAll(polygonLatLngs
        .map((e) => LatLng(e.latLng.latitude, e.latLng.longitude))
        .toList());
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

    FFAppState().circleLatLng = LatLng(point.latitude, point.longitude);
    FFAppState().circleRadius = radius;
  }

  // Set Markers to the map
  void _setMarkers(gmf.LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      _markers.add(gmf.Marker(
        markerId: gmf.MarkerId(markerIdVal),
        position: point,
        infoWindow: InfoWindow(
            title: 'PSR Household',
            snippet:
                'latitude: ${point.latitude} longitude: ${point.longitude}'),
      ));
    });
  }

  // Remove last polygon point
  void _clearAll() {
    setState(() {
      _polygons.clear();
      polygonLatLngs.clear();
      FFAppState().polygonLatLngList.clear();
      _circles.clear();
      FFAppState().circleLatLng = null;
      FFAppState().circleRadius = 0.0;
      // _markers.clear();
    });
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
              child: FutureBuilder<bool>(
                future: _getStartingMapLocation(),
                builder: (context, snapshot) {
                  //   Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitFoldingCube(
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  return gmf.GoogleMap(
                    initialCameraPosition: gmf.CameraPosition(
                      target: _map_center_location,
                      zoom: _zoomLevel,
                    ),
                    mapType: gmf.MapType.hybrid,
                    markers: _markers,
                    onMapCreated: _onMapCreated,
                    circles: _circles,
                    polygons: _polygons,
                    myLocationEnabled: true,
                    onCameraMove: (CameraPosition cp) {
                      FFAppState().mapZoomLevel = cp.zoom;
                      FFAppState().mapCenterLocation =
                          LatLng(cp.target.latitude, cp.target.longitude);
                    },
                    onTap: (point) {
                      if (_isPolygon) {
                        setState(() {
                          _lastItemType = 'polygon';

                          polygonLatLngs.add(PolygonLatLng(
                              latLng: point, polygonReference: null));
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
                  );
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
                    _clearAll();
                  },
                  text: 'Clear All',
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
            ],
          ),
        ),
      ],
    );
  }
}

// create a class with latlngs and reference
class PolygonLatLng {
  late gmf.LatLng latLng;
  late DocumentReference<Object?>? polygonReference;
  // create a constructor
  PolygonLatLng({required this.latLng, this.polygonReference});
}
