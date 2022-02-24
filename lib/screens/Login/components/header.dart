import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Center(
          child: Text(
            'Login', 
            style: TextStyle(
              color: kColorTextOnSecondary,
              fontSize: 40,
            ) 
          ),
        ),
        SizedBox(height: 10,),
        Center(
          child: Text(
            "Welcome to Expense App",
            style: TextStyle(
              color: kColorTextOnSecondary,
              fontSize: 18
            ),
          ),
        )
      ],
    );
  }
}