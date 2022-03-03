import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/Home/components/category/list.dart';
import 'package:flutter_application_1/screens/Home/components/expense/list.dart';
import 'package:flutter_application_1/screens/Home/components/expense/update.dart';
import 'package:flutter_application_1/screens/Home/components/header.dart';
import 'package:flutter_application_1/screens/Home/components/user/list.dart';
import 'package:flutter_application_1/service/category.dart';

import 'components/navbar.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.jwt,
  }) : super(key: key);

  static String routeName = "/home";
  final String jwt;

  factory Home.fromBase64(String jwt) =>
    Home(
      jwt: jwt,
    );

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _flexHeader = 3;
  bool _isList = true;
  CategoryService categoryService = CategoryService();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeFlex(int flex){
    setState(() {
      _flexHeader = flex;

    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      ExpenseList(onDetail: _changeFlex, jwt: widget.jwt),
      const CategoryList(),
      const UserList(),
    ];

    List<Widget> _widgetOptionsUpdate = <Widget>[
      FutureBuilder(
        future: categoryService.getAll(widget.jwt),
        builder: 
        (context, snapshot) =>
          snapshot.hasData? 
          ExpenseUpdate.fromBase64(widget.jwt, snapshot.data as List<Category>)
          :
          snapshot.hasError ? const Text("An error occured"): const Text("An error occured"),
        //child: ExpenseUpdate.fromBase64(widget.jwt)
      ),
      FutureBuilder(
        future: categoryService.getAll(widget.jwt),
        builder: 
        (context, snapshot) =>
          snapshot.hasData? 
          ExpenseUpdate.fromBase64(widget.jwt, snapshot.data as List<Category>)
          :
          snapshot.hasError ? const Text("An error occured"): const Text("An error occured"),
        //child: ExpenseUpdate.fromBase64(widget.jwt)
      ),      
      FutureBuilder(
        future: categoryService.getAll(widget.jwt),
        builder: 
        (context, snapshot) =>
          snapshot.hasData? 
          ExpenseUpdate.fromBase64(widget.jwt, snapshot.data as List<Category>)
          :
          snapshot.hasError ? const Text("An error occured"): const Text("An error occured"),
        //child: ExpenseUpdate.fromBase64(widget.jwt)
      ),
    ];

    List<String> _widgetNames = <String> [
      "Expense", "Category", "User"
    ];


    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [
              kColorSecondaryLight,
              kColorSecondary,
              kColorSecondaryDark,
            ]
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              flex: _flexHeader,
              child: Header(title: _widgetNames[_selectedIndex], changeFlex: _changeFlex,),
            ),
            Flexible(
              flex: 10 - _flexHeader,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _isList? _widgetOptions[_selectedIndex ]: _widgetOptionsUpdate[_selectedIndex],
                      CustomNavigationBar(
                        selector: _onItemTapped,
                        widgets: _widgetOptions,
                        currentIndex: _selectedIndex,
                      ),
                    ], 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * (_flexHeader-1)/10),
        child: FloatingActionButton(
          onPressed: (() {
            _changeFlex(2);
            setState(() {
              _isList = false;
            });
          }),
          child: const Icon(Icons.add),
          backgroundColor: kColorPrimary
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop
    );
  }
}
