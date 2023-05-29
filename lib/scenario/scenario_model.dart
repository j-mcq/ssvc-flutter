import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ScenarioModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in scenario widget.
  ScenarioRecord? outCreateScenario;
  InstantTimer? instantTimer;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for scenarioName widget.
  TextEditingController? scenarioNameController;
  String? Function(BuildContext, String?)? scenarioNameControllerValidator;
  String? _scenarioNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a scenario name';
    }

    return null;
  }

  // State field(s) for outageDuration widget.
  TextEditingController? outageDurationController;
  String? Function(BuildContext, String?)? outageDurationControllerValidator;
  String? _outageDurationControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter s scenario duration';
    }

    return null;
  }

  // Stores action output result for [Custom Action - saveScenario] action in Button widget.
  DocumentReference? outSaveScenarioInputs;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    scenarioNameControllerValidator = _scenarioNameControllerValidator;
    outageDurationControllerValidator = _outageDurationControllerValidator;
  }

  void dispose() {
    instantTimer?.cancel();
    sideBarNavModel.dispose();
    scenarioNameController?.dispose();
    outageDurationController?.dispose();
  }

  /// Additional helper methods are added here.

}
