import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_active_response_item_widget.dart';
import '/components/edit_active_response_item_widget.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class StockInformationModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? responseItemFilter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResponseItemsRecord? outCreateResponseItem;
  // Stores action output result for [Custom Action - deleteResponseItem] action in Icon widget.
  String? outDeleteResponseItem;
  // Stores action output result for [Custom Action - deleteActiveResponseItem] action in Icon widget.
  String? outDeleteActiveResponseItems;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
