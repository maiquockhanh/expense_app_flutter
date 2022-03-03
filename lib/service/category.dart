import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/constants.dart';

class Category {
  Category({
    required this.id,
    required this.name
  });
        
    final int id;
    final String name;
               
    factory Category.fromJson(Map<String, dynamic> json) 
    {
      return Category(
        id: json['id'],
        name: json['name'], 
      );
    }
}



class CategoryService {
  var url = baseUrl;
  
  Future<List<Category>> getAll(String jwt) async {
    debugPrint("Loading Category data");
    final response = await http.get(
      Uri.parse(
        '$baseUrl/api/categories'
      ), 
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );

    List<Category> categories = [];
    json.decode(response.body).forEach(
      (e){
        categories.add(Category.fromJson(e));
      }
    );
    return categories;
  }


}