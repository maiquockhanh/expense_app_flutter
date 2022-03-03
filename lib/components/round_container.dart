import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    Key? key,
    required this.child,
    required this.color,
    this.widthWeight,
    this.height
  }) :  super(key: key);

  final Widget child;
  final Color color;
  final double? widthWeight;
  final double? height;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30)
          ),
          width: widthWeight != null? size.width*widthWeight! :size.width*0.8 ,
          height: height ?? 60,
          //child: child,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
          child: child,
        ),
      ]
    );
  }
}
