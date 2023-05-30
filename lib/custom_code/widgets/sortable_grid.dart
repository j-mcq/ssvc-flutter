// Automatic FlutterFlow imports
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
import 'package:file_saver/file_saver.dart';

class SortableGrid extends StatefulWidget {
  const SortableGrid({
    Key? key,
    this.width,
    this.height,
    this.titles,
    this.fields,
    this.types,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? titles;
  final List<String>? fields;
  final List<String>? types;

  @override
  _SortableGridState createState() => _SortableGridState();
}

class _SortableGridState extends State<SortableGrid> {
  final List<String>? titlesTest = [
    'Address',
    'Postcode',
    'User',
    'Support Eligibility',
    'Support Requests',
    'Original EPC Rating',
    'EPC Rating',
    'Heating Data',
    'Energy Supplier',
    // 'prePaymentMeter',
    // 'housingSituation',
    // 'financialSituation',
    // 'grossHouseholdIncome',
    // 'councilTaxBand',
    'Benefits Data',
    // 'occupantsUnder5',
    // 'occupants5To17',
    // 'occupants18To60',
    // 'occupants61To66',
    // 'occupantsOver66',
    // 'originalWallDescription',
    // 'wallDescription',
    // 'originalWallInsulation',
    // 'wallInsulation',
    // 'originalRoofDescription',
    // 'roofDescription',
    // 'originalRoofInsulation',
    // 'roofInsulation',
    // 'originalFloorDescription',
    // 'floorDescription',
    // 'originalFloorInsulation',
    // 'floorInsulation',
    // 'originalWindowDescription',
    // 'Window Description',
  ];
  final List<String>? fieldsTest = [
    'address',
    'postcode',
    'userName',
    'supportEligibility',
    'supportRequests',
    'originalEpcRating',
    'epcRating',
    'heatingData',
    'energySupplier',
    // 'prePaymentMeter',
    // 'housingSituation',
    // 'financialSituation',
    // 'grossHouseholdIncome',
    // 'councilTaxBand',
    'benefitsData',
    // 'occupantsUnder5',
    // 'occupants5To17',
    // 'occupants18To60',
    // 'occupants61To66',
    // 'occupantsOver66',
    // 'originalWallDescription',
    // 'wallDescription',
    // 'originalWallInsulation',
    // 'wallInsulation',
    // 'originalRoofDescription',
    // 'roofDescription',
    // 'originalRoofInsulation',
    // 'roofInsulation',
    // 'originalFloorDescription',
    // 'floorDescription',
    // 'originalFloorInsulation',
    // 'floorInsulation',
    // 'originalWindowDescription',
    // 'windowDescription',
  ];

  //
  final List<String>? typeTest = [
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
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
    final List<PlutoColumnType> types = [];
    // convert string types to PlutoColumnType
    typeTest!.forEach((e) => {
          if (e == 'text')
            {types.add(PlutoColumnType.text())}
          else if (e == 'number')
            {types.add(PlutoColumnType.number())}
          else if (e == 'date')
            {types.add(PlutoColumnType.date())}
        });

    final List<PlutoColumn> columns = <PlutoColumn>[];
    // create columns
    for (var i = 0; i < titlesTest!.length; i++) {
      columns.add(PlutoColumn(
        title: titlesTest![i],
        field: fieldsTest![i],
        type: PlutoColumnType.text(),
      ));
    }

    return Container(
      child: FutureBuilder<List<PlutoRow>>(
        future: getDataForAllProperties(),
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
                    width: MediaQuery.of(context).size.width - 368,
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
                      configuration: const PlutoGridConfiguration(),
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

Future<List<PlutoRow>> getDataForAllProperties() async {
  final List<PlutoRow> rows = [];

  final properyRecords = await queryPropertiesRecordOnce();
  final supportOptionRecords = await querySupportOptionsRecordOnce();
  for (var propertyRecord in properyRecords) {
    List<UsersRecord> userRecords = [];
    List<UserRequestsRecord> userRequestsRecords = [];
    String userRequestList = '';

    try {
      if (propertyRecord.owner != null) {
        //  userRecord = await UsersRecord.getDocumentOnce(propertyRecord.owner!);
        userRecords = await queryUsersRecordOnce(
          queryBuilder: (user) =>
              user.where('uid', isEqualTo: propertyRecord.owner!.id),
        );

        if (userRecords.length > 0) {
          try {
            userRequestsRecords = await queryUserRequestsRecordOnce(
                parent: userRecords.first.reference);

            for (var userRequestsRecord in userRequestsRecords) {
              userRequestList += supportOptionRecords
                      .where((element) =>
                          element.reference ==
                          userRequestsRecord.supportOption!)
                      .first
                      .name! +
                  ', ';
            }
          } catch (e) {
            print('Error processing user request records: ' + e.toString());
          }
        }
      }
    } catch (e) {
      print('Error processing user records: ' + e.toString());
    }

    // use hardcoded collection to allow iterating over bools as fields for heating, energy supplier and benefits.
    final property = FirebaseFirestore.instance
        .collection('properties')
        .doc(propertyRecord.reference.id);
    final epcDataRecords =
        await queryEpcDataRecordOnce(parent: propertyRecord.reference);

    final heatingDataRecords = await property.collection('heating_data').get();
    String heatingDataList =
        await getStringListFromCollection(heatingDataRecords);

    final energySupplierDataRecords =
        await property.collection('energy_supplier_data').get();
    String energySupplierDataList =
        await getStringListFromCollection(energySupplierDataRecords);

    final benefitsDataRecords =
        await property.collection('benefits_data').get();
    String benefitsDataList =
        await getStringListFromCollection(benefitsDataRecords);

    final financeDataRecords =
        await queryFinanceDataRecordOnce(parent: propertyRecord.reference);
    final occupantsDataRecords =
        await queryOccupantDataRecordOnce(parent: propertyRecord.reference);

    List<SupportOptionsEligibilityRecord> supportEligibilityRecords = [];
    String supportEligibilityList = '';
    try {
      supportEligibilityRecords =
          await querySupportOptionsEligibilityRecordOnce(
              parent: propertyRecord.reference);
      for (var supportEligibilityRecord in supportEligibilityRecords) {
        supportEligibilityList +=
            supportEligibilityRecord.supportOptionName! + ', ';
      }
    } catch (e) {
      print('Error processing support eligibility records: ' + e.toString());
    }

    rows.add(PlutoRow(
      cells: {
        'address': PlutoCell(value: propertyRecord.address1!),
        'postcode': PlutoCell(value: propertyRecord.postCode!),
        'userName': PlutoCell(
            value: userRecords.length > 0 ? userRecords.first.email : ''),
        'supportEligibility': PlutoCell(value: supportEligibilityList),
        'supportRequests': PlutoCell(value: userRequestList),
        'originalEpcRating': PlutoCell(
            value: epcDataRecords.length > 0
                ? epcDataRecords.first.originalEpcRating!
                : ''),
        'epcRating': PlutoCell(
            value: epcDataRecords.length > 0
                ? epcDataRecords.first.epcRating!
                : ''),
        'heatingData': PlutoCell(value: heatingDataList),
        'energySupplier': PlutoCell(value: energySupplierDataList),
        // 'prePaymentMeter':
        //     PlutoCell(value: financeDataRecords.first.hasPrePaymentMeter),
        // 'housingSituation':
        //     PlutoCell(value: financeDataRecords.first.housingSituation),
        // 'financialSituation':
        //     PlutoCell(value: financeDataRecords.first.financialSituation),
        // 'grossHouseholdIncome':
        //     PlutoCell(value: financeDataRecords.first.grossHouseholdIncome),
        // 'councilTaxBand':
        //     PlutoCell(value: financeDataRecords.first.councilTaxBand),
        'benefitsData': PlutoCell(value: benefitsDataList),
        // 'occupantsUnder5': PlutoCell(
        //     value: occupantsDataRecords.first.occupantsUnder5.toString()),
        // 'occupants5To17': PlutoCell(
        //     value: occupantsDataRecords.first.occupants5To17.toString()),
        // 'occupants18To60': PlutoCell(
        //     value: occupantsDataRecords.first.occupants18To60.toString()),
        // 'occupants61To66': PlutoCell(
        //     value: occupantsDataRecords.first.occupants61To66.toString()),
        // 'occupantsOver66': PlutoCell(
        //     value: occupantsDataRecords.first.occupantsOver66.toString()),
        // 'originalWallDescription':
        //     PlutoCell(value: epcDataRecords.first.originalWallDescription),
        // 'wallDescription':
        //     PlutoCell(value: epcDataRecords.first.wallDescription),
        // 'originalWallInsulation':
        //     PlutoCell(value: epcDataRecords.first.originalWallInsulation),
        // 'wallInsulation': PlutoCell(value: epcDataRecords.first.wallInsulation),
        // 'originalRoofDescription':
        //     PlutoCell(value: epcDataRecords.first.originalRoofDescription),
        // 'roofDescription':
        //     PlutoCell(value: epcDataRecords.first.roofDescription),
        // 'originalRoofInsulation':
        //     PlutoCell(value: epcDataRecords.first.originalRoofInsulation),
        // 'roofInsulation': PlutoCell(value: epcDataRecords.first.roofInsualtion),
        // 'originalFloorDescription':
        //     PlutoCell(value: epcDataRecords.first.originalFloorDescription),
        // 'floorDescription':
        //     PlutoCell(value: epcDataRecords.first.floorDescription),
        // 'originalFloorInsulation':
        //     PlutoCell(value: epcDataRecords.first.originalFloorInsulation),
        // 'floorInsulation':
        //     PlutoCell(value: epcDataRecords.first.floorInsulation),
        // 'originalWindowDescription':
        //     PlutoCell(value: epcDataRecords.first.originalWindowsDescription),
        // 'windowDescription':
        //     PlutoCell(value: epcDataRecords.first.windowsDescription),
      },
    ));
  }
  return rows;
}

Future<String> getStringListFromCollection(
    QuerySnapshot<Map<String, dynamic>> collection) async {
  String list = '';

  for (var key in collection.docs.first.data().keys) {
    if (collection.docs.first.data()[key] == true) {
      list += key.toString() + ', ';
    }
  }
  return list;
}
