import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnterRadiusModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for radius widget.
  TextEditingController? radiusController;
  String? Function(BuildContext, String?)? radiusControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    radiusController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
