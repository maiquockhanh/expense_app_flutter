import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/Home/components/category/list.dart';
import 'package:flutter_application_1/screens/Home/components/expense/list.dart';
import 'package:flutter_application_1/screens/Home/components/user/list.dart';

import 'components/navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ExpenseList(),
    CategoryList(),
    UserList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _widgetOptions[_selectedIndex ],
          CustomNavigationBar(
            selector: _onItemTapped,
            widgets: _widgetOptions,
            currentIndex: _selectedIndex,
          ),
        ], 
      ) 
    );
  }
}
