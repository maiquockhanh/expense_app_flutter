import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/roundContainer.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/components/input.dart';
import 'package:flutter_application_1/screens/Home/home.dart';

class Body extends StatefulWidget {

  const Body({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _inputLoginHandler = TextEditingController();
  final _inputPasswordHandler = TextEditingController();

  void _handleSubmit() {
    if(_inputPasswordHandler.text == "admin" && _inputLoginHandler.text == "admin"){
      Navigator.pushNamed(context, Home.routeName);
      debugPrint("Login success");
    }else{
      debugPrint("Login failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80)
          ),
          color: Colors.white
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            SizedBox(height: size.height * 0.07),
            RoundContainer(
              color: kColorPrimaryLight,
              child: InputField(
              inputLoginHandler: _inputLoginHandler, 
              isObscure: false, 
              icon: Icons.person, 
              hintText: "Login",
              ),
            ),
            RoundContainer(
              color: kColorPrimaryLight,
              child: InputField(
                inputLoginHandler: _inputPasswordHandler, 
                isObscure: true, 
                icon: Icons.lock, 
                suffixIcon: Icons.visibility, 
                hintText: "Password"
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundContainer(
              color: kColorPrimary,
              child: GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    _handleSubmit();
                  }
                },
                child: const TextButton(
                  child: Text("Login", style: TextStyle(color: kColorTextOnPrimary),),
                  onPressed: null,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an Account? ", 
                  style: TextStyle(color: kColorPrimaryDark),
                ),
                GestureDetector(
                  onTap: (){
                    debugPrint("Go to sign up page");
                  },
                  child: const Text(
                    "Sign Up", 
                    style: TextStyle(
                      color: kColorPrimaryDark,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}

