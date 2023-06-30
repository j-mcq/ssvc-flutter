// Automatic FlutterFlow imports
import 'dart:convert';

import 'package:file_saver/file_saver.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:flutter/services.dart';

Future downloadTemplate(String? type) async {
  // Add your function code here!
  if (type != null) {
    switch (type) {
      case 'responseItems':
        saveCsv('response-item-template.csv');

        break;
      case 'psrData':
        saveCsv('psr-data-template.csv');
        break;
      case 'userGuide':
        saveCsv('SSVC-User-Guide-v0.1.pdf');
        break;
      default:
    }
  }
}

Future<void> saveCsv(String filename) async {
  String templatePath = 'files/$filename';
  ByteData bytes = await rootBundle.load(templatePath);

  await FileSaver.instance
      .saveFile(name: filename, bytes: bytes.buffer.asUint8List(), ext: '.csv');
}
