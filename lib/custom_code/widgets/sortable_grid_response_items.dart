// Automatic FlutterFlow imports
import 'dart:convert';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:file_saver/file_saver.dart';

class SortableGridResponseItems extends StatefulWidget {
  const SortableGridResponseItems({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SortableGridResponseItemsState createState() =>
      _SortableGridResponseItemsState();
}

class _SortableGridResponseItemsState extends State<SortableGridResponseItems> {
  final List<String> fieldTitles = [
    'Item Id',
    'Response Item',
    'Current Charge (%)',
    'Home Depot',
    'Location',
    'Status',
    'Is Available?',
  ];
  final List<String> fields = [
    'unitId',
    'responseItem',
    'chargeStatus',
    'homeDepot',
    'location',
    'statusDescription',
    'isAvailable',
  ];

  final List<PlutoColumnType> fieldTypes = [
    PlutoColumnType.text(),
    PlutoColumnType.text(),
    PlutoColumnType.number(
      negative: false,
      format: '0.00',
      applyFormatOnInit: true,
      allowFirstDot: false,
    ),
    PlutoColumnType.text(),
    PlutoColumnType.text(),
    PlutoColumnType.text(),
    PlutoColumnType.text(),
  ];

  final List<bool> readOnlyFields = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  final List<Widget Function(PlutoColumnRendererContext)?> renderers = [
    null,
    null,
    (rendererContext) {
      Color textColor = Colors.black;

      if (rendererContext.cell.value >= .90) {
        textColor = Colors.green;
      } else if (rendererContext.cell.value < .90 &&
          rendererContext.cell.value >= .60) {
        textColor = Colors.orange;
      } else {
        textColor = Colors.red;
      }

      return Text(
        rendererContext.cell.value.toString(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      );
    },
    null,
    null,
    null,
    null,
  ];

  late final PlutoGridStateManager stateManager;

  void exportToCsv() async {
    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // use file_saver from pub.dev
    await FileSaver.instance
        .saveFile(name: 'export.csv', bytes: exported, ext: '.csv');
  }

  @override
  Widget build(BuildContext context) {
    final List<PlutoColumn> columns = <PlutoColumn>[];
    // create columns
    for (var i = 0; i < 7; i++) {
      columns.add(PlutoColumn(
          title: fieldTitles[i],
          field: fields[i],
          type: fieldTypes[i],
          readOnly: readOnlyFields[i],
          renderer: renderers[i]));
    }
    final plutoGridLocaleText =
        PlutoGridLocaleText(filterContains: 'Filter column');

    final plutogridStyleConfig = PlutoGridStyleConfig(
      enableColumnBorderVertical: false,
      borderColor: Color(0xFFDCF5FF),
      gridBorderColor: Colors.white,
    );
    final plutoGridConfiguration = PlutoGridConfiguration(
        style: plutogridStyleConfig, localeText: plutoGridLocaleText);

    return Container(
      child: FutureBuilder<List<PlutoRow>>(
        future: getData(),
        builder: (context, snapshot) {
          //   Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<PlutoRow> dataTableRows = snapshot.data!;
          return Column(children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: responsiveVisibility(
                            context: context, phone: false, tablet: false)
                        ? MediaQuery.of(context).size.width - 294
                        : MediaQuery.of(context).size.width - 64,
                    height: 1000,
                    child: PlutoGrid(
                      columns: columns,
                      rows: dataTableRows,
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager = event.stateManager;
                        stateManager.setShowColumnFilter(true);
                      },
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                      configuration: plutoGridConfiguration,
                    ))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: exportToCsv, child: const Text('Export to CSV'))
              ],
            )
          ]);
        },
      ),
    );
  }
}

Future<List<PlutoRow>> getData() async {
  final List<PlutoRow> rows = [];
  final activeResponseItems = await queryActiveResponseItemsRecordOnce();
  for (ActiveResponseItemsRecord activeResponseItem in activeResponseItems) {
    rows.add(PlutoRow(
      cells: {
        'unitId': PlutoCell(value: activeResponseItem.reference.id),
        'responseItem': PlutoCell(value: activeResponseItem.responseItemName),
        'chargeStatus': PlutoCell(value: activeResponseItem.chargingStatus),
        'homeDepot': PlutoCell(value: activeResponseItem.homeDepotName),
        'location': PlutoCell(value: activeResponseItem.location),
        'statusDescription':
            PlutoCell(value: activeResponseItem.statusDescription),
        'isAvailable': PlutoCell(value: activeResponseItem.isAvailable),
      },
    ));
  }
  return rows;
}
