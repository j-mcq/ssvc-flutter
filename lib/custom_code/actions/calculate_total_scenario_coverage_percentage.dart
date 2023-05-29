// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> calculateTotalScenarioCoveragePercentage() async {
  // Add your function code here!
  try {
    int scenarioCount = 0;
    int scenarioCoverCheck = 0;

    final scenarioResults = await queryScenarioResultsRecordOnce();

    for (var scenario in scenarioResults) {
      scenarioCount++;
      if (scenario.responseCoverage == 1) scenarioCoverCheck++;
    }
    return scenarioCoverCheck / scenarioCount;
  } catch (e) {
    print('Error calculating total scenario coverage percentage: $e');
    return 0;
  }
}
