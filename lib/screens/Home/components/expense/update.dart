import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/components/round_container.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/service/category.dart';
import 'package:flutter_application_1/service/login/expense_service.dart';

class ExpenseUpdate extends StatefulWidget {
  const ExpenseUpdate({ 
    Key? key,
    required this.jwt,
    required this.categories,
    required this.navigation,
  }) : super(key: key);

  final String jwt;
  final List<Category> categories;
  final Function navigation;

  factory ExpenseUpdate.fromBase64(String jwt, List<Category> categories, Function navigation) =>
  ExpenseUpdate(
    jwt: jwt,
    categories: categories,
    navigation: navigation,
  );

  @override
  State<ExpenseUpdate> createState() => _ExpenseUpdateState();
}

class _ExpenseUpdateState extends State<ExpenseUpdate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryService categoryService = CategoryService();
  Category? dropdownValue;
  _handleSubmit(){

    var form = json.encode({
      "amount": int.parse(_inputAmountHandler.text),
      "merchant": _inputMerchantHandler.text,
      "status": "WAITING_FOR_APPROVAL",
      "date": DateTime.now().toString().split(' ')[0],
      "category": {
        "id": dropdownValue?.id,
        "name": dropdownValue?.name
      }
    });

    ExpenseService().create(form, widget.jwt);
    widget.navigation();

  }
  final _inputAmountHandler = TextEditingController();
  final _inputMerchantHandler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child:  Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80)
          ),
          color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            RoundContainer(
              color: kColorPrimaryLight,
              child: TextFormField(
                controller: _inputAmountHandler,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Amount (VND)",
                  border: InputBorder.none,
                  labelText: 'Amount (VND)',
                ),
              ),
              widthWeight: 0.9,
            ),
            SizedBox(height: size.height * 0.01),
            RoundContainer(
              color: kColorPrimaryLight,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _inputMerchantHandler,
                decoration: const InputDecoration(
                  hintText: "Merchant",
                  border: InputBorder.none,
                  labelText: 'Merchant',
                ),
              ),
              widthWeight: 0.9,
            ),
            SizedBox(height: size.height * 0.01),
            RoundContainer(
              color: kColorPrimaryLight,
              child: DropdownButtonFormField<Category>(
                value: dropdownValue ?? widget.categories[0],
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                validator: (value) {
                  if (value == null) {
                    return 'Please choose an option';
                  }
                  return null;
                },
                style: const TextStyle(color: kColorSecondaryDark),
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: InputBorder.none,
                ),
                onChanged: (Category? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    debugPrint(dropdownValue?.name);
                  });
                },
                items: widget.categories
                    .map<DropdownMenuItem<Category>>((Category value) {
                  return DropdownMenuItem<Category>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
              widthWeight: 0.9,
            ),
            
            SizedBox(height: size.height * 0.01),
            RoundContainer(
              color: kColorPrimary,
              child: GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    _handleSubmit();
                  }
                },
                child: const TextButton(
                  child: Text("Create", style: TextStyle(color: kColorTextOnPrimary),),
                  onPressed: null,
                ),
              ),
              widthWeight: 0.9,
              height: 50,
            ),

            // RoundContainer(
            //   color: kColorPrimaryLight,
            //   child: DropdownButtonFormField(
            //     value: dropdownValue,
            //     icon: const Icon(Icons.arrow_downward),
            //     elevation: 16,
            //     style: const TextStyle(color: kColorSecondaryDark),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownValue = newValue!;
            //       });
            //     },
            //     items: <String>['', 'One', 'Two', 'Free', 'Four']
            //         .map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //   ),
            //   widthWeight: 0.9,
            // ),
            // SizedBox(height: size.height * 0.01),
            // RoundContainer(
            //   color: kColorPrimaryLight,
            //   child: DropdownButtonFormField(
            //     value: dropdownValue,
            //     icon: const Icon(Icons.arrow_downward),
            //     elevation: 16,
            //     style: const TextStyle(color: kColorSecondaryDark),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownValue = newValue!;
            //       });
            //     },
            //     items: <String>['', 'One', 'Two', 'Free', 'Four']
            //         .map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //   ),
            //   widthWeight: 0.9,
            // ),
          ],
        ),
      )
    );
  }
}