import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:ssvc/app_state.dart';
import 'package:ssvc/backend/backend.dart';
import 'package:ssvc/backend/firebase/firebase_config.dart';
import 'package:ssvc/custom_code/actions/calculate_scenario_response.dart';
import 'package:ssvc/flutter_flow/flutter_flow_theme.dart';
import 'package:ssvc/main.dart';
import '../mock_data/mock_data.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
// create a test for the  calculateScenarioResponse() function

  group('Get Scenario Response', () {
    test('Scenario Response Check 1', () async {
      // create mock data
      //  final YourFirebaseAuthClass authService = YourFirebaseAuthClass();

      final userReference = await getTestUserReference();
      final scenarioReference = await getTestScenarioReference(userReference);

      await calculateScenarioResponse(scenarioReference);

      final responseItems =
          await queryScenarioResponseItemsRecordOnce(parent: scenarioReference);

      expect(3, 3);

      // clean up
      await scenarioReference.delete();
      await userReference.delete();
    });
  });
}

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}
