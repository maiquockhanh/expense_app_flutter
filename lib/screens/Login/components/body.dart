import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/round_container.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/components/input.dart';
import 'package:flutter_application_1/screens/Home/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/service/login/login_service.dart';

class Body extends StatefulWidget {

  const Body({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _inputLoginHandler = TextEditingController();
  final _inputPasswordHandler = TextEditingController();
  final LoginService loginService = LoginService(); 
  final storage = const FlutterSecureStorage();
  String error = "";

  void showError(String text) {
    setState(() {
      error = text;
    });
  }

  void _handleSubmit() async {
    var credential = json.encode({
      "username": _inputLoginHandler.text,
      "password": _inputPasswordHandler.text
    });

    var response = await loginService.login(credential);

    if (response.idToken == ""){
      showError("Username or Password is invalid");
      return;
    }
    else{
      storage.write(key: "jwt", value: response.idToken);
      if(_scaffoldKey.currentContext != null) {
        BuildContext ctx = _scaffoldKey.currentContext!;
        Navigator.push(ctx, 
          MaterialPageRoute(
            builder: (context) => Home.fromBase64(response.idToken)
          )
        );
      }
    }

    // if(response.idToken != ""){
    //   storage.write(key: "jwt", value: response.idToken);
    //   Navigator.push(context, 
    //     MaterialPageRoute(
    //       builder: (context) => Home.fromBase64(response.idToken)
    //     )
    //   );
    // }
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
              height: 50,
              color: kColorPrimaryLight,
              child: InputField(
                key: const Key("username_field"),
                inputLoginHandler: _inputLoginHandler, 
                isObscure: false, 
                icon: Icons.person, 
                hintText: "Login",
                validateErrorText: "Please enter user name",
              ),
            ),
            RoundContainer(
              height: 50,
              color: kColorPrimaryLight,
              child: InputField(
                key: const Key("password_field"),
                inputLoginHandler: _inputPasswordHandler, 
                isObscure: true, 
                icon: Icons.lock, 
                suffixIcon: Icons.visibility, 
                hintText: "Password",
                validateErrorText: "Please enter password",
              ),
            ),
            SizedBox(height: size.height * 0.03),
            error == "" ? Container(): 
                Text(error, style: const TextStyle(color: Colors.red, fontSize: 13),),
            RoundContainer(
              height: 50,
              color: kColorPrimary,
              child: GestureDetector(
                key: const Key("login_button"),
                onTap: (){
                  showError("");
                  if(_formKey.currentState!.validate()){
                    _handleSubmit();
                    debugPrint("Login button is tapped");
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

