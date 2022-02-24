import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/home.dart';
import 'package:flutter_application_1/screens/Login/login.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => const Login(),
  Home.routeName: (context) => const Home(),
};