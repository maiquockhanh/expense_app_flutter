import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/navigationItem.dart';
import 'package:flutter_application_1/constants.dart';

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
      decoration: BoxDecoration(
        color: kColorSecondaryLight.withOpacity(0.3),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0x55555555),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50), 
          topRight: Radius.circular(50)
        )
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationItem(
              icon: Icons.book_online_sharp, 
              selector: selector, index: 0, 
              currentIndex: currentIndex, 
              lastIndex: widgets.length - 1,
            ),
            NavigationItem(
              icon: Icons.category, 
              selector: selector, 
              index: 1, 
              currentIndex: currentIndex,
              lastIndex: widgets.length - 1,
            ),
            NavigationItem(
              icon: Icons.person, 
              selector: selector, 
              index: 2, 
              currentIndex: currentIndex,
              lastIndex: widgets.length - 1,
            ),
          ],
        ),
      ),
    );
  }
}
