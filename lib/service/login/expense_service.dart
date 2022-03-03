import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/category.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/constants.dart';

        // "id": 1,
        // "date": "2022-02-08",
        // "merchant": "paradigms",
        // "amount": 12395,
        // "status": "WAITING_FOR_APPROVAL",
        // "paymentMethod": "Tranfer",
        // "refNo": "Pizza User",
        // "image": "",
        // "imageContentType": "image/png",
        // "category": null,
        // "company": null,
        // "applicationUser": null

class Expense {
  Expense({
    this.id,
    this.category,
    this.amount,
    this.merchant,
    this.date,
    this.status,
    this.user,
  });
        
    final int? id;
    final Category? category;
    final int? amount;
    final String? merchant;
    final String? date;
    final bool? status;
    final String? user;
               
    factory Expense.fromJson(Map<String, dynamic> json) 
    {
      return Expense(
        id: json['id'] ?? "",
        category: Category.fromJson(json['category']), 
        amount: json['amount'] as int, 
        merchant: json['merchant'],
        date: json['date']?? "",
        status: json['status'] == "APROVED",
        user: json['applicationUser'] ?? "",
      );
    }
}



class ExpenseService {
  var url = baseUrl;

  Future<bool> create(String body, String jwt) async {
    final response = await http.post(
      Uri.parse(
        'http://192.168.1.32:8080/api/expenses'
      ), 
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $jwt'      
      },
      body: body
    );

    return response.statusCode == 200;

  }
  
  Future<List<Expense>> getAll(String jwt) async {
    debugPrint("Loading expense data");
    final response = await http.get(
      Uri.parse(
        '$baseUrl/api/expenses'
      ), 
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );
    
    List<Expense> epxenses = [];
    var num = 0;
    json.decode(response.body).forEach(
      (e){
        num++;
        epxenses.add(Expense.fromJson(e));
        debugPrint(num.toString());
      }
    );
    //debugPrint(epxenses.toString());

    return epxenses;
  }
}