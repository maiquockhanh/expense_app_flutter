import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:http/http.dart' as http;

class JWT{
    JWT({ required this.idToken });
        
    final String idToken;
               
    factory JWT.fromJson(Map<String, dynamic> json) 
    {
      return JWT(idToken: json['id_token']);
    }
}

class LoginService {
  final url = baseUrl; 

  Future<JWT> login(Object credential) async {
    final response = await http.post(
      Uri.parse(
        '$baseUrl/api/authenticate'
      ), 
      headers: {"Content-Type": "application/json"},
      body: credential
    );

    debugPrint(response.toString());
    
    if (response.statusCode == 200) {
      return JWT.fromJson(jsonDecode(response.body));
    } else {
      return JWT.fromJson({"id_token": ""});
    }
  }
}


