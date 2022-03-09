import 'dart:convert';

import 'package:flutter_application_1/service/login/expense_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('expense factory', () async {
    //ARRANGE
    Map<String, dynamic> json = jsonDecode(
      '''
      {
       "id" : 9,
       "date" : "2022-03-08",
       "merchant" : "array Movies bluetooth",
       "amount" : 19783,
       "status" : "WAITING_FOR_APPROVAL",
       "paymentMethod" : "Credit",
       "category" : {
          "id": 1,
          "name": "Table"
       }
    }
    '''
    );

    //ACT
    Expense expense = Expense.fromJson(json);


    //ASSERT
    expect(expense, isNotNull);

  });

  test('expense factory if category is null', () async {
    Map<String, dynamic> json = jsonDecode(
    '''
      {
       "id" : 9,
       "date" : "2022-03-08",
       "merchant" : "array Movies bluetooth",
       "amount" : 19783,
       "status" : "WAITING_FOR_APPROVAL",
       "paymentMethod" : "Credit",
       "category" : null
      }
    '''
    );

    //ACT
    Expense expense = Expense.fromJson(json);

    //ASSERT
    expect(expense, isNotNull);

  });

}