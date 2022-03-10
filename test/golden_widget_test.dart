import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/service/login/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'golden_widget_test.mocks.dart';

@GenerateMocks([LoginService])
void main() {
  Widget makeTestableWidget({required Widget child}){
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),  
    );
  }


  testWidgets('Init login screen', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: const Login()));
    await expectLater(find.byType(Login),
                      matchesGoldenFile('login_1.png'));
  });

  testWidgets('Login fail screen when username and password are empty', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: const Login()));
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();
    await expectLater(find.byType(Login), matchesGoldenFile('login_2.png'));
  });


  testWidgets('Login fail screen when password is empty', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: const Login()));
    await tester.enterText(find.byKey(const Key("username_field")), 'admin');
    await tester.pump();
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();
    await expectLater(find.byType(Login), matchesGoldenFile('login_3.png'));
  });


  testWidgets('Login fail screen when username is empty', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: const Login()));
    await tester.enterText(find.byKey(const Key("password_field")), 'admin');
    await tester.pump();
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();
    await expectLater(find.byType(Login), matchesGoldenFile('login_4.png'));
  });

  testWidgets('Login fail screen when credetial is invalid', (WidgetTester tester) async {

    final loginService = MockLoginService();

    when(
      loginService.login(any)
    )
    .thenAnswer((_) async => JWT.fromJson({"id_token": ""}));


    await tester.pumpWidget(makeTestableWidget(child: const Login()));
    await tester.enterText(find.byKey(const Key("username_field")), 'a');
    await tester.enterText(find.byKey(const Key("password_field")), 'a');
    await tester.pump();
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();
    await expectLater(find.byType(Login), matchesGoldenFile('login_5.png'));
  });
}