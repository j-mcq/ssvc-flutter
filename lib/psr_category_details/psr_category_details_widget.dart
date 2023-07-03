import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'psr_category_details_model.dart';
export 'psr_category_details_model.dart';

class PsrCategoryDetailsWidget extends StatefulWidget {
  const PsrCategoryDetailsWidget({
    Key? key,
    this.psrCategoryOptionsReference,
  }) : super(key: key);

  final DocumentReference? psrCategoryOptionsReference;

  @override
  _PsrCategoryDetailsWidgetState createState() =>
      _PsrCategoryDetailsWidgetState();
}

class _PsrCategoryDetailsWidgetState extends State<PsrCategoryDetailsWidget> {
  late PsrCategoryDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PsrCategoryDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              wrapWithModel(
                model: _model.sideBarNavModel,
                updateCallback: () => setState(() {}),
                child: SideBarNavWidget(
                  oneBG: FlutterFlowTheme.of(context).secondaryBackground,
                  twoBG: FlutterFlowTheme.of(context).secondaryBackground,
                  threeColor: FlutterFlowTheme.of(context).secondaryBackground,
                  fourColor: FlutterFlowTheme.of(context).secondaryBackground,
                  psrCategoriesColour:
                      FlutterFlowTheme.of(context).primaryBackground,
                  depotColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ),
                      ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 32.0, 16.0, 0.0),
                          child: StreamBuilder<PsrCategoryOptionsRecord>(
                            stream: PsrCategoryOptionsRecord.getDocument(
                                widget.psrCategoryOptionsReference!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final categoryContainerPsrCategoryOptionsRecord =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'PSR Category Details',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .medical_services,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 16.0),
                                              child: TextFormField(
                                                controller: _model
                                                        .itemNameController ??=
                                                    TextEditingController(
                                                  text:
                                                      categoryContainerPsrCategoryOptionsRecord
                                                          .name,
                                                ),
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.itemNameController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    setState(() {
                                                      FFAppState().isEditing =
                                                          true;
                                                    });
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Category Name',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .itemNameControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(),
                                                child: StreamBuilder<
                                                    List<
                                                        PsrCategoryGroupOptionsRecord>>(
                                                  stream:
                                                      queryPsrCategoryGroupOptionsRecord()
                                                        ..listen((snapshot) {
                                                          List<PsrCategoryGroupOptionsRecord>
                                                              psrgroupDropDownPsrCategoryGroupOptionsRecordList =
                                                              snapshot;
                                                          if (_model.psrgroupDropDownPsrCategoryGroupOptionsRecordListPreviousSnapshot !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      PsrCategoryGroupOptionsRecordDocumentEquality())
                                                                  .equals(
                                                                      psrgroupDropDownPsrCategoryGroupOptionsRecordList,
                                                                      _model
                                                                          .psrgroupDropDownPsrCategoryGroupOptionsRecordListPreviousSnapshot)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .isEditing =
                                                                  true;
                                                            });

                                                            setState(() {});
                                                          }
                                                          _model.psrgroupDropDownPsrCategoryGroupOptionsRecordListPreviousSnapshot =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<PsrCategoryGroupOptionsRecord>
                                                        psrgroupDropDownPsrCategoryGroupOptionsRecordList =
                                                        snapshot.data!;
                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .psrgroupDropDownValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.psrgroupDropDownValue ??=
                                                            categoryContainerPsrCategoryOptionsRecord
                                                                .psrGroupName,
                                                      ),
                                                      options:
                                                          psrgroupDropDownPsrCategoryGroupOptionsRecordList
                                                              .map(
                                                                  (e) => e.name)
                                                              .toList(),
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .psrgroupDropDownValue =
                                                              val),
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      hintText:
                                                          'Select the PSR Group Category',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      borderWidth: 2.0,
                                                      borderRadius: 40.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 16.0),
                                              child: TextFormField(
                                                controller: _model
                                                        .resilienceScoreController ??=
                                                    TextEditingController(
                                                  text:
                                                      categoryContainerPsrCategoryOptionsRecord
                                                          .resilienceScore
                                                          .toString(),
                                                ),
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.resilienceScoreController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    setState(() {
                                                      FFAppState().isEditing =
                                                          true;
                                                    });
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Resilience Score',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        signed: true,
                                                        decimal: true),
                                                validator: _model
                                                    .resilienceScoreControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 16.0),
                                              child: TextFormField(
                                                controller: _model
                                                        .estimatedEnergyConsumptionController ??=
                                                    TextEditingController(
                                                  text:
                                                      categoryContainerPsrCategoryOptionsRecord
                                                          .powerConsumption
                                                          .toString(),
                                                ),
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.estimatedEnergyConsumptionController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    setState(() {
                                                      FFAppState().isEditing =
                                                          true;
                                                    });
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Estimated Power Consumption (W)',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        signed: true,
                                                        decimal: true),
                                                validator: _model
                                                    .estimatedEnergyConsumptionControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Stock Location Detais',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      22.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValue ??=
                                                          categoryContainerPsrCategoryOptionsRecord
                                                              .electricallyDependant,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkboxValue =
                                                            newValue!);
                                                        if (newValue!) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .isEditing =
                                                                true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                    .isEditing =
                                                                true;
                                                          });
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Is electrically dependant?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.05),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                20.0, 32.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.formKey
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }

                                                        await widget
                                                            .psrCategoryOptionsReference!
                                                            .update(
                                                                createPsrCategoryOptionsRecordData(
                                                          name: _model
                                                              .itemNameController
                                                              .text,
                                                          resilienceScore: double
                                                              .tryParse(_model
                                                                  .resilienceScoreController
                                                                  .text),
                                                          powerConsumption: double
                                                              .tryParse(_model
                                                                  .estimatedEnergyConsumptionController
                                                                  .text),
                                                          electricallyDependant:
                                                              _model
                                                                  .checkboxValue,
                                                          psrGroupName: _model
                                                              .psrgroupDropDownValue,
                                                        ));
                                                        setState(() {
                                                          FFAppState()
                                                                  .isEditing =
                                                              false;
                                                        });

                                                        context.pushNamed(
                                                            'psrCategories');
                                                      },
                                                      text: 'Save Changes',
                                                      options: FFButtonOptions(
                                                        width: 270.0,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 200.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
