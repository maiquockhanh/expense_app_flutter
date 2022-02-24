import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key? key,
    required this.selector,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  final Function selector;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.home, color: currentIndex==index? kColorPrimaryDark: kColorPrimaryLight,), onPressed: () => selector(index)
      )
    );
  }
}
