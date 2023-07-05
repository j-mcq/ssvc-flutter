import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class StockItemDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
      return 'Please enter an item name';
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
      return 'Please enter the item storage capacity';
    }

    return null;
  }

  // Stores action output result for [Custom Action - calculateTotalStockLevels] action in Button widget.
  int? outCalculateTotalStockLevels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    itemNameControllerValidator = _itemNameControllerValidator;
    energyCapacityControllerValidator = _energyCapacityControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    itemNameController?.dispose();
    descriptionController?.dispose();
    unitPriceController?.dispose();
    energyCapacityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
