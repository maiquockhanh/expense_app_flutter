// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: DataTable(
          rows: [

          ],
          columns: [
            DataColumn(label: Text("User")),
            DataColumn(label: Text("Amount")),
            DataColumn(label: Text("Status")),
          ],
        ),
      )
    );
  }
}