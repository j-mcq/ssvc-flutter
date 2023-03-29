import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class StockItemDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for itemName widget.
  TextEditingController? itemNameController1;
  String? Function(BuildContext, String?)? itemNameController1Validator;
  // State field(s) for myBio widget.
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateController;
  // State field(s) for itemName widget.
  TextEditingController? itemNameController2;
  String? Function(BuildContext, String?)? itemNameController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    sideBarNavModel.dispose();
    itemNameController1?.dispose();
    myBioController?.dispose();
    itemNameController2?.dispose();
  }

  /// Additional helper methods are added here.

}
