import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditActiveResponseItemModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for homeDepotDropDown widget.
  String? homeDepotDropDownValue;
  FormFieldController<String>? homeDepotDropDownValueController;
  // State field(s) for statusDropDown widget.
  String? statusDropDownValue;
  FormFieldController<String>? statusDropDownValueController;
  // Stores action output result for [Custom Action - getDepotReference] action in Button widget.
  DocumentReference? outDepotReference;
  // Stores action output result for [Custom Action - getStatusReference] action in Button widget.
  DocumentReference? outStatusReference;
  // Stores action output result for [Custom Action - getStatusName] action in Button widget.
  String? outStatusName;
  // Stores action output result for [Custom Action - getDepotName] action in Button widget.
  String? outDepotName;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
