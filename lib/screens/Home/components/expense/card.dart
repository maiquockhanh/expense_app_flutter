import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants.dart';

class ExpenseCard extends StatefulWidget {

  const ExpenseCard({
    Key? key,
    required this.id,
    required this.amount,
    required this.date,
    required this.category,
    required this.merchant,
    required this.user,
    required this.status,
    required this.changeFlex,
  }) : super(key: key);

  final int id;
  final int amount;
  final String date;
  final String? category;
  final String? merchant;
  final String? user;
  final bool status;
  final Function changeFlex;

  @override
  _ExpenseCardState createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {

  var _isCollapse = false;
  void _collapse () {
    setState((){
      _isCollapse = !_isCollapse;
    });
      
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _isCollapse? 150: 50,
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: kColorPrimaryDark,
      ),
      child: 
        Column(
          children: [
            GestureDetector(
              onTap: _collapse,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20), 
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(_isCollapse?0:20), 
                  bottomRight: Radius.circular(_isCollapse?0:20)
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
                  color: kColorPrimaryDark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.id.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white                        
                              ),
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.timer_outlined, 
                                    size: 13,
                                    color: Colors.white,
                                  )
                                ),
                                TextSpan(
                                  text: " " + widget.date,
                                )
                              ]
                            )
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: widget.status? Colors.green: Colors.red,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Text(
                          widget.status? "Approved": "Waiting",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white                        
                          ),
                        ),
                      )
                      
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20), 
                bottomRight: Radius.circular(20)
              ),
              child: Container(
                height: _isCollapse? 100: 0,
                color: kColorPrimary,
                padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amount: " + ( widget.amount.toString()) + " .VND",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        ),
                        Text(
                          "Category: "+ ( widget.category?? ""),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        ),
                        Text(
                          "Merchant: "+ (widget.merchant??""),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        ),
                        Text(
                          "User: " + (widget.user??""),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        widget.changeFlex(1);
                      }, 
                      icon: const Icon(Icons.edit)
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        
        
      
    );
  }
}

