import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/navigationItem.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({ 
    Key? key,
    required this.widgets,
    required this.selector,
    required this.currentIndex
  }) : super(key: key);

  final List<Widget> widgets;
  final Function selector;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0x55555555),
          )
        ]
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationItem(selector: selector, index: 0, currentIndex: currentIndex),
            NavigationItem(selector: selector, index: 1, currentIndex: currentIndex),
            NavigationItem(selector: selector, index: 2, currentIndex: currentIndex),
          ],
        ),
      ),
    );
  }
}
