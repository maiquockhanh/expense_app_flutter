import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

void main() {
  group("App test", (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('Full app Test', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key("username_field")), 'admin');
      await tester.enterText(find.byKey(const Key("password_field")), 'admin');
      await tester.pump();
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pumpAndSettle();

    });
  });
}