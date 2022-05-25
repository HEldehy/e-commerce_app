import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
//  TextOverflow textOverflow;
  SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    //this.textOverflow = TextOverflow.ellipsis,
    this.size = 12,
    this.height=1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        fontWeight: FontWeight.bold,
        //FontWeight.W400
        //fontFamily: 'Roboto'
      ),
    );
  }
}
