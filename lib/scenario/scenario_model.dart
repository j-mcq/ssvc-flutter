import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ScenarioModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? scenarioName;

  double? outageDuration;

  ///  State fields for stateful widgets in this page.

  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for scenarioName widget.
  TextEditingController? scenarioNameController;
  String? Function(BuildContext, String?)? scenarioNameControllerValidator;
  // State field(s) for outageDuration widget.
  TextEditingController? outageDurationController;
  String? Function(BuildContext, String?)? outageDurationControllerValidator;
  // Stores action output result for [Custom Action - saveScenario] action in Button widget.
  DocumentReference? outSaveScenarioInputs;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    sideBarNavModel.dispose();
    scenarioNameController?.dispose();
    outageDurationController?.dispose();
  }

  /// Additional helper methods are added here.

}
