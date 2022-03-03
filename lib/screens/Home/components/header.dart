import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    required this.changeFlex,
  }) : super(key: key);

  final String title;
  final Function changeFlex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(title,
                style: const TextStyle(
                  color: kColorTextOnSecondary,
                  fontSize: 40,
                )),
          ),
        ],
      ),
    );
  }
}
