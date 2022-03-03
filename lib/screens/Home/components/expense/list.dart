// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/components/expense/card.dart';

import 'package:flutter_application_1/service/data.dart';
import 'package:flutter_application_1/service/login/expense_service.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({
    Key? key,
    required this.onDetail,
    required this.jwt
  }) : super(key: key);

  final List<Map<String, dynamic>> expenses = Data.expense;
  final Function onDetail;
  final String jwt;
  final ExpenseService expenseService = ExpenseService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: FutureBuilder(
        future: expenseService.getAll(jwt),
        builder: (context, snapshot) =>
          snapshot.hasData? 
          //   DataTable(
          //   rows: (snapshot.data as List<Expense>).map((expense) => 
          //     DataRow(cells: [
          //       DataCell(Text(expense.amount.toString())),
          //       DataCell(Text(expense.merchant)),
          //       DataCell(IconButton(onPressed: () => onDetail(1), icon: Icon(Icons.arrow_drop_down))),
          //     ])
          //   ).toList(),
          //   columns: [
          //     DataColumn(label: Text("Amount")),
          //     DataColumn(label: Text("Merchant")),
          //     DataColumn(label: Text("")),
          //   ]
          // )
          Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemBuilder: (contexr, index) {
                    if (index == (snapshot.data as List<Expense>).length ){
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                      );
                    }
                    return ExpenseCard(
                      id: (snapshot.data as List<Expense>)[index].id ?? 0,
                      amount: (snapshot.data as List<Expense>)[index].amount ?? 0,
                      date: (snapshot.data as List<Expense>)[index].date ?? "",
                      status: (snapshot.data as List<Expense>)[index].status ?? false,
                      merchant: (snapshot.data as List<Expense>)[index].merchant ?? "",
                      user: (snapshot.data as List<Expense>)[index].user ?? "",
                      category: (snapshot.data as List<Expense>)[index].category!.name ?? "",
                      changeFlex: onDetail,
                    );
                  },
                  itemCount: (snapshot.data as List<Expense>).length + 1,
                )
              ),
            ],
          )            
          :
          snapshot.hasError ? Text("An error occured"): CircularProgressIndicator()
      )
    );
  }
}