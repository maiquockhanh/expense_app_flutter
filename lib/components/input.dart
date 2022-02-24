import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.isObscure,
    required this.hintText,
    required this.icon,
    this.suffixIcon,
    required TextEditingController inputLoginHandler,
  }) : _inputLoginHandler = inputLoginHandler, super(key: key);

  final bool isObscure;
  final String hintText;
  final IconData icon;
  final IconData? suffixIcon;
  final TextEditingController _inputLoginHandler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        icon: Icon(icon, color: kColorPrimaryDark,),
        suffixIcon: GestureDetector(
          onTap: (){},
          child: Icon(suffixIcon, color: kColorPrimaryDark)
        ),
      ),
      controller: _inputLoginHandler,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter login';
        }
        return null;
      },
    );
  }
}

