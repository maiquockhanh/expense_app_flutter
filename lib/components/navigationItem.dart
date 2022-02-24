import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key? key,
    required this.selector,
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.lastIndex,
  }) : super(key: key);

  final Function selector;
  final int index;
  final int currentIndex;
  final IconData icon;
  final int lastIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: currentIndex==index?kColorSecondaryDark.withAlpha(100):null,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(index == 0? 50 : 0), 
            topRight: Radius.circular(index == lastIndex? 50 : 0)
          )
        ),
        child: IconButton(
          icon: Icon(icon, color: currentIndex==index? kColorPrimary : kColorSecondaryDark,), onPressed: () => selector(index)
        ),
      )
    );
  }
}
