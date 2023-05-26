import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/edit_stock_number_widget.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class StockItemDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for itemName widget.
  TextEditingController? itemNameController;
  String? Function(BuildContext, String?)? itemNameControllerValidator;
  String? _itemNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for unitPrice widget.
  TextEditingController? unitPriceController;
  String? Function(BuildContext, String?)? unitPriceControllerValidator;
  // State field(s) for energyCapacity widget.
  TextEditingController? energyCapacityController;
  String? Function(BuildContext, String?)? energyCapacityControllerValidator;
  String? _energyCapacityControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    itemNameControllerValidator = _itemNameControllerValidator;
    energyCapacityControllerValidator = _energyCapacityControllerValidator;
  }

  void dispose() {
    sideBarNavModel.dispose();
    itemNameController?.dispose();
    descriptionController?.dispose();
    unitPriceController?.dispose();
    energyCapacityController?.dispose();
  }

  /// Additional helper methods are added here.

}
