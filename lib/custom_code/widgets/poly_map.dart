/// Automatic FlutterFlow imports
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

import 'package:ssvc/components/enter_radius_widget.dart';
import 'package:ssvc/flutter_flow/flutter_flow_google_map.dart';
import 'package:ssvc/flutter_flow/flutter_flow_widgets.dart';
import 'package:ssvc/scenario/scenario_model.dart';

import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
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
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:selectable_list/selectable_list.dart';

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

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class PolygonMarkerSet {
  gmf.PolygonId id;
  int index;
  Set<gmf.Marker> markers;
  List<gmf.LatLng> markerPositions;
  PolygonMarkerSet(this.id, this.index, this.markers, this.markerPositions);
}

class _PolyMapState extends State<PolyMap> {
  final _unfocusNode = FocusNode();
  // Location

  // Maps
  Set<gmf.Marker> _markers = HashSet<gmf.Marker>();
  Set<gmf.Marker> _polygonMarkers = HashSet<gmf.Marker>();
  Set<PolygonMarkerSet> _polygonMarkerSet = HashSet<PolygonMarkerSet>();
  List<gmf.LatLng> _markerPositions = <gmf.LatLng>[];

  Set<gmf.Polygon> _polygons = HashSet<gmf.Polygon>();
  Set<gmf.Circle> _circles = HashSet<gmf.Circle>();
  late gmf.GoogleMapController _googleMapController;
  late gmf.BitmapDescriptor _markerIcon;
  late gmf.BitmapDescriptor _depotMarkerIcon;
  late gmf.BitmapDescriptor _draggableMarkerIcon;
  List<PolygonLatLng> polygonLatLngs = <PolygonLatLng>[];
  late double radius;

  //ids
  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  gmf.PolygonId _selectedPolygonId = gmf.PolygonId('polygon_id_1');
  // Type controllers
  bool _isPolygon = false; // Default
  bool _isMarker = true;
  bool _isCircle = false;
  bool _isDataLoaded = false;
  String _lastItemType = 'polygon';
  bool _showPsrHouseholds = false;
  bool _showDepots = true;
  double _zoomLevel = 10; // Default

  gmf.LatLng _searchLatLng = gmf.LatLng(53.178703, -2.994242);
  gmf.LatLng _mapCenterLocation = gmf.LatLng(53.178703, -2.994242);

  TextEditingController searchController = TextEditingController();

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
        _mapCenterLocation = gmf.LatLng(
            scenarioRecord.mapCenterLocation!.latitude,
            scenarioRecord.mapCenterLocation!.longitude);
      }
      if (scenarioRecord.mapZoomLevel > 0) {
        _zoomLevel = scenarioRecord.mapZoomLevel;
      }
    } else if (widget.currentLocation != null) {
      _mapCenterLocation = gmf.LatLng(
          widget.currentLocation!.latitude, widget.currentLocation!.longitude);
    }
    if (_isDataLoaded == false) {
      await _loadMapData();
    }
    return true;
  }

  // This function is to change the marker icon
  void _setMarkerIcon() async {
    _depotMarkerIcon = await gmf.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/depot-32.png');

    _draggableMarkerIcon = await gmf.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20)), 'assets/images/move.png');
  }

  _clearAppState() {
    FFAppState().circleLatLng = null;
    FFAppState().circleRadius = 0.0;
    FFAppState().mapCenterLocation = null;
    FFAppState().mapZoomLevel = _zoomLevel;
  }

  Future<bool> searchLocation(String query) async {
    if (query.isEmpty) {
      return true;
    }
    final apiKey =
        'AIzaSyAEzM6c72bBO1ldCv-Xy-W7oUOl3Q8lf_U'; // TODO use api key from flutterflow config.

    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$query&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'OK' && data['results'].isNotEmpty) {
        final location = data['results'][0]['geometry']['location'];
        final lat = location['lat'];
        final lng = location['lng'];

        setState(() {
          _searchLatLng = gmf.LatLng(lat, lng);
        });

        _googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(_searchLatLng, 15),
        );
      } else {
        return true;
      }
    }
    return false;
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
          FFAppState().polygonLatLngList.clear();
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

        _isDataLoaded = true;
      }
      if (_showPsrHouseholds) {
        final psrHouseholds = await queryPsrRecordOnce();

        for (var psrHousehold in psrHouseholds) {
          _setMarkers(
              gmf.LatLng(psrHousehold.latitude!, psrHousehold.longitude!),
              false,
              psrHousehold.postcode);
        }
      }
      if (_showDepots) {
        final depots = await queryDepotsRecordOnce();

        for (var depot in depots) {
          _setMarkers(
              gmf.LatLng(depot.location!.latitude, depot.location!.longitude),
              true,
              depot.name);
        }
      }
    }
    _isDataLoaded = true;
  }

  // Draw Polygon to the map
  void _setPolygon() {
    if (_polygons.length == 0) {
      final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
      _selectedPolygonId = gmf.PolygonId(polygonIdVal);
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
  void _setMarkers(gmf.LatLng point, bool isDepot, String title) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;

    setState(() {
      _markers.add(gmf.Marker(
        markerId: gmf.MarkerId(markerIdVal),
        position: point,
        draggable: true,
        anchor: Offset(0.5,
            0.5), // This is not working - https://github.com/flutter/flutter/issues/80578
        icon: isDepot ? _markerIcon : BitmapDescriptor.defaultMarker,
        onTap: () => this._markers.remove(gmf.MarkerId(markerIdVal)),
        onDragEnd: (newPosition) => {
          _markers
              .firstWhere(
                  (marker) => marker.markerId == gmf.MarkerId(markerIdVal))
              .copyWith(positionParam: newPosition)
        },
      ));
    });
  }

  void createPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _selectedPolygonId = gmf.PolygonId(polygonIdVal);
    final randomColour = Color((Random().nextDouble() * 0xFFFFFF).toInt());
    _polygons.add(gmf.Polygon(
      polygonId: gmf.PolygonId(polygonIdVal),
      points: polygonLatLngs.map((e) => e.latLng).toList(),
      strokeWidth: 2,
      strokeColor: randomColour.withOpacity(1.0),
      fillColor: randomColour.withOpacity(0.15),
    ));

    _selectedPolygonId = gmf.PolygonId(polygonIdVal);
    _polygonMarkerSet.add(PolygonMarkerSet(
        _selectedPolygonId, _polygonIdCounter, Set<Marker>(), []));
    _polygonIdCounter++;
  }

  void _setPolygonMarkers(gmf.LatLng point, gmf.PolygonId polygonId) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;

    if (_polygons.length == 0) {
      createPolygon();
    }

    final marker = gmf.Marker(
      markerId: gmf.MarkerId(markerIdVal),
      position: point,
      draggable: true,
      icon: _draggableMarkerIcon,
      anchor: Offset(0.5, 0.5),
      onTap: () => removeMarker(gmf.MarkerId(markerIdVal)),
      onDragEnd: (newPosition) => {
        updatePolygonMarkerPosition(
            newPosition, gmf.MarkerId(markerIdVal), polygonId)
      },
    );

    setState(() {
      _markerPositions.add(point);
      _polygonMarkers.add(marker);
      _polygonMarkerSet
          .firstWhere((element) => element.id == polygonId)
          .markers
          .add(marker);
      _polygonMarkerSet
          .firstWhere((element) => element.id == polygonId)
          .markerPositions
          .add(point);
      updateMarkers();
      updatePolygonMarkerPosition(point, null, polygonId);
    });
  }

  updateMarkers() {
    _markers = _polygonMarkers;
    // for (var markerSet in _polygonMarkerSet) {
    //   _markers.addAll(markerSet.markers);
    // }
  }

  gmf.PolygonId? getPolygonIdFromMarkerId(gmf.MarkerId markerId) {
    for (var markerSet in _polygonMarkerSet) {
      for (var marker in markerSet.markers) {
        if (marker.markerId == markerId) {
          return markerSet.id;
        }
      }
    }
    return null;
  }

  removeMarker(gmf.MarkerId markerId) {
    int index = 0;
    Polygon polygon = _polygons.firstWhere(
        (polygon) => polygon.polygonId == getPolygonIdFromMarkerId(markerId));

    final markerSet = _polygonMarkerSet.firstWhere(
        (element) => element.id == getPolygonIdFromMarkerId(markerId));

    for (var marker in markerSet.markers) {
      if (marker.markerId == markerId) {
        setState(() {
          _markers.remove(marker);
          markerSet.markers.remove(marker);
          polygon.points.removeAt(index);
        });
        _markerPositions.removeAt(index);
        markerSet.markerPositions.removeAt(index);
      }

      index += 1;
    }
  }

  void updatePolygonMarkerPosition(gmf.LatLng newPosition,
      gmf.MarkerId? markerId, gmf.PolygonId? polygonId) {
    List<gmf.LatLng>? polygonLatLngs = [];

    int index = 0;

    if (markerId != null) {
      polygonId = getPolygonIdFromMarkerId(markerId);
    }
    _selectedPolygonId = polygonId!;

    final markerSet =
        _polygonMarkerSet.firstWhere((element) => element.id == polygonId);

    for (var marker in markerSet.markers) {
      if (marker.markerId == markerId) {
        marker.copyWith(positionParam: newPosition);

        polygonLatLngs.add(newPosition);
        markerSet.markerPositions[index] = newPosition;
      } else {
        polygonLatLngs.add(markerSet.markerPositions[index]);
      }
      index += 1;
    }

    Polygon polygon =
        _polygons.firstWhere((polygon) => polygon.polygonId == polygonId);
    setState(() {
      polygon.points.clear();
      polygon.points.addAll(polygonLatLngs
          .map((e) => gmf.LatLng(e.latitude, e.longitude))
          .toList());
    });

    FFAppState().polygonList = [];
    List<PolygonListStruct> polygonList = [];

    for (var polygonMarkerSet in _polygonMarkerSet) {
      polygonList.add(PolygonListStruct(
          polygonIndex: polygonMarkerSet.index,
          polygonLatLngs: polygonMarkerSet.markerPositions
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList()));
    }
    FFAppState().polygonList = polygonList;

    FFAppState().polygonLatLngList.clear();
    FFAppState().polygonLatLngList.addAll(
        polygonLatLngs.map((e) => LatLng(e.latitude, e.longitude)).toList());
  }

  void _createPolygon() {
    createPolygon();
  }

  // Remove last polygon point
  void _clearAll() {
    setState(() {
      _polygons.clear();
      _polygonMarkers.clear();
      _markerPositions.clear();
      _markers.clear();
      _polygonMarkerSet.clear();
      _circles.clear();
      _polygonIdCounter = 1;
      _circleIdCounter = 1;
      _markerIdCounter = 1;
      _selectedPolygonId = gmf.PolygonId('polygon_id_1');

      polygonLatLngs.clear();

      FFAppState().polygonLatLngList.clear();

      FFAppState().polygonList = [];

      FFAppState().circleLatLng = null;
      FFAppState().circleRadius = 0.0;
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
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(children: [
            Container(
              width: MediaQuery.of(context).size.width * .5,
              child: TextFormField(
                controller: searchController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Search for a postcode',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Container(
                width: 150,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final noResults =
                          await searchLocation(searchController.text);
                      if (noResults) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'No results found',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }
                    },
                    text: 'Search',
                    icon: Icon(
                      Icons.search,
                      size: 14,
                    ),
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                )),
          ]),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: responsiveVisibility(
                      context: context, phone: false, tablet: false)
                  ? MediaQuery.of(context).size.width - 294
                  : MediaQuery.of(context).size.width - 64,
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
                      target: _mapCenterLocation,
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
                          // _markers.clear();
                          _setPolygonMarkers(point, _selectedPolygonId);
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
          width: MediaQuery.of(context).size.width,
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
                  text: 'Clear Polygon',
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
                  onPressed: () {
                    //Remove the last point setted at the polygon
                    _createPolygon();
                  },
                  text: 'New Polygon',
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
