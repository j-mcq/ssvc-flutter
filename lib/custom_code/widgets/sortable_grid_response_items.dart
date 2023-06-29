// Automatic FlutterFlow imports
import 'dart:convert';

import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
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
import 'package:faker/faker.dart';

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
    'Status',
    'Is Available?',
  ];
  final List<String> fields = [
    'unitId',
    'responseItem',
    'chargeStatus',
    'homeDepot',
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
  ];

  final List<bool> readOnlyFields = [
    true,
    true,
    true,
    false,
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
  ];

  late PlutoGridStateManager stateManager;

  bool checkReadOnly(PlutoRow row, PlutoCell cell) {
    return row.cells['status']!.value != 'created';
  }

  void saveData() async {
    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // use file_saver from pub.dev
    await FileSaver.instance
        .saveFile(name: 'export.csv', bytes: exported, ext: '.csv');
  }

  void exportToCsv() async {
    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // use file_saver from pub.dev
    await FileSaver.instance
        .saveFile(name: 'export.csv', bytes: exported, ext: '.csv');
  }

  void handleOnRowSelected(PlutoGridOnRowCheckedEvent event) {
    if (event.isRow) {
      // or event.isAll
      print('Toggled A Row.');
      print(event.row?.cells['column1']?.value);
    } else {
      print('Toggled All Rows.');
      print(stateManager.checkedRows.length);
    }
  }

  deleteItems() {}
  @override
  Widget build(BuildContext context) {
    final List<PlutoColumn> columns = <PlutoColumn>[];
    // create columns
    for (var i = 0; i < fieldTitles.length; i++) {
      columns.add(PlutoColumn(
          enableRowChecked: i == 0,
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
                        event.stateManager
                            .setSelectingMode(PlutoGridSelectingMode.row);
                        stateManager = event.stateManager;
                        stateManager.setShowColumnFilter(true);
                      },
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                      onRowChecked: handleOnRowSelected,
                      configuration: plutoGridConfiguration,
                      createHeader: (stateManager) =>
                          _Header(stateManager: stateManager),
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
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: saveData, child: const Text('Export to CSV'))
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

class _Header extends StatefulWidget {
  const _Header({
    required this.stateManager,
    Key? key,
  }) : super(key: key);

  final PlutoGridStateManager stateManager;

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  final faker = Faker();

  int addCount = 1;

  int addedCount = 0;

  PlutoGridSelectingMode gridSelectingMode = PlutoGridSelectingMode.row;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.stateManager.setSelectingMode(gridSelectingMode);
    });
  }

  void handleAddColumns() {
    final List<PlutoColumn> addedColumns = [];

    for (var i = 0; i < addCount; i += 1) {
      addedColumns.add(
        PlutoColumn(
          title: faker.food.cuisine(),
          field: 'column${++addedCount}',
          type: PlutoColumnType.text(),
        ),
      );
    }

    widget.stateManager.insertColumns(
      widget.stateManager.bodyColumns.length,
      addedColumns,
    );
  }

  void handleAddRows() {
    final newRows = widget.stateManager.getNewRows(count: addCount);

    for (var e in newRows) {
      e.cells['status']!.value = 'created';
    }

    widget.stateManager.appendRows(newRows);

    widget.stateManager.setCurrentCell(
      newRows.first.cells.entries.first.value,
      widget.stateManager.refRows.length - 1,
    );

    widget.stateManager.moveScrollByRow(
      PlutoMoveDirection.down,
      widget.stateManager.refRows.length - 2,
    );

    widget.stateManager.setKeepFocus(true);
  }

  void handleSaveAll() {
    widget.stateManager.setShowLoading(true);

    Future.delayed(const Duration(milliseconds: 500), () {
      for (var row in widget.stateManager.refRows) {
        if (row.cells['status']!.value != 'saved') {
          row.cells['status']!.value = 'saved';
        }

        if (row.cells['id']!.value == '') {
          row.cells['id']!.value = 'guest';
        }

        if (row.cells['name']!.value == '') {
          row.cells['name']!.value = 'anonymous';
        }
      }

      widget.stateManager.setShowLoading(false);
    });
  }

  void handleRemoveCurrentColumnButton() {
    final currentColumn = widget.stateManager.currentColumn;

    if (currentColumn == null) {
      return;
    }

    widget.stateManager.removeColumns([currentColumn]);
  }

  void handleRemoveCurrentRowButton() {
    print(widget.stateManager.currentRow!.toJson());
    widget.stateManager.removeCurrentRow();
  }

  void handleRemoveSelectedRowsButton() {
    widget.stateManager.removeRows(widget.stateManager.currentSelectingRows);
  }

  void handleFiltering() {
    widget.stateManager
        .setShowColumnFilter(!widget.stateManager.showColumnFilter);
  }

  void setGridSelectingMode(PlutoGridSelectingMode? mode) {
    if (mode == null || gridSelectingMode == mode) {
      return;
    }

    setState(() {
      gridSelectingMode = mode;
      widget.stateManager.setSelectingMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: addCount,
                items:
                    [1, 5, 10, 50, 100].map<DropdownMenuItem<int>>((int count) {
                  final color = addCount == count ? Colors.blue : null;

                  return DropdownMenuItem<int>(
                    value: count,
                    child: Text(
                      count.toString(),
                      style: TextStyle(color: color),
                    ),
                  );
                }).toList(),
                onChanged: (int? count) {
                  setState(() {
                    addCount = count ?? 1;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: handleAddColumns,
              child: const Text('Add columns'),
            ),
            ElevatedButton(
              onPressed: handleAddRows,
              child: const Text('Add rows'),
            ),
            ElevatedButton(
              onPressed: handleSaveAll,
              child: const Text('Save all'),
            ),
            ElevatedButton(
              onPressed: handleRemoveCurrentColumnButton,
              child: const Text('Remove Current Column'),
            ),
            ElevatedButton(
              onPressed: handleRemoveCurrentRowButton,
              child: const Text('Remove Current Row'),
            ),
            ElevatedButton(
              onPressed: handleRemoveSelectedRowsButton,
              child: const Text('Remove Selected Rows'),
            ),
            ElevatedButton(
              onPressed: handleFiltering,
              child: const Text('Toggle filtering'),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: gridSelectingMode,
                items: PlutoGridSelectingMode.values
                    .map<DropdownMenuItem<PlutoGridSelectingMode>>(
                        (PlutoGridSelectingMode item) {
                  final color = gridSelectingMode == item ? Colors.blue : null;

                  return DropdownMenuItem<PlutoGridSelectingMode>(
                    value: item,
                    child: Text(
                      item.name,
                      style: TextStyle(color: color),
                    ),
                  );
                }).toList(),
                onChanged: (PlutoGridSelectingMode? mode) {
                  setGridSelectingMode(mode);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
