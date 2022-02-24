import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/header.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  static String routeName = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget> [
        Flexible(child: Header(), flex: 3,),
        Flexible(child: Body(), flex: 7)
      ]
    );
  }
}