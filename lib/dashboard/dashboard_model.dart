import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  double? totalResponseItems = 0.0;

  double? totalScenarioCoverage = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - calculateAllResponseItemsCount] action in dashboard widget.
  int? outAllResponseItemsCount;
  // Stores action output result for [Custom Action - calculateTotalScenarioCoveragePercentage] action in dashboard widget.
  double? outTotalScenarioCoveragePercentage;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    sideBarNavModel.dispose();
  }

  /// Additional helper methods are added here.

}
