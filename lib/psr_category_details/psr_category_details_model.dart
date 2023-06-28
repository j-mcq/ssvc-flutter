import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PsrCategoryDetailsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? isElectricallyDependent;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for itemName widget.
  TextEditingController? itemNameController;
  String? Function(BuildContext, String?)? itemNameControllerValidator;
  // State field(s) for statusDropDown widget.
  String? statusDropDownValue;
  FormFieldController<String>? statusDropDownValueController;
  // State field(s) for resilienceScore widget.
  TextEditingController? resilienceScoreController;
  String? Function(BuildContext, String?)? resilienceScoreControllerValidator;
  // State field(s) for estimatedEnergyConsumption widget.
  TextEditingController? estimatedEnergyConsumptionController;
  String? Function(BuildContext, String?)?
      estimatedEnergyConsumptionControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    itemNameController?.dispose();
    resilienceScoreController?.dispose();
    estimatedEnergyConsumptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
