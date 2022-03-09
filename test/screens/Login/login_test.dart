import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}){
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),  
    );
  }

  testWidgets('Login test', (tester) async {

    Login login = const Login();

    await tester.pumpWidget(makeTestableWidget(child: login));
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();

    //EXPECT
    expect(find.text("Please enter user name"), findsOneWidget);
    expect(find.text("Please enter password"), findsOneWidget);

  });
}