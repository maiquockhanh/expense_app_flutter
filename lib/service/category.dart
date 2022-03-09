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
               
    factory Category.fromJson(Map<String, dynamic>? json) 
    {
      if (json == null){
        return Category(
          id: 0,
          name: "", 
        );
      }
      else{
        return Category(
          id: json['id']?? 0,
          name: json['name'] ?? "", 
        );
      }
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

  Future<List<Category>> getAllMmock(String jwt) async {
    debugPrint("Loading Category data");
    return [
      Category(id: 1, name: "cat1"),
      Category(id: 2, name: "cat2"),
      Category(id: 3, name: "cat3"),
      Category(id: 4, name: "cat4"),
      Category(id: 5, name: "cat5"),
      Category(id: 6, name: "cat6"),
      Category(id: 7, name: "cat7"),
    ];
  }


}