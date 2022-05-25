import 'package:flutter/material.dart';

import 'dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.textOverflow = TextOverflow.ellipsis,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.bold,
        //FontWeight.W400
        //fontFamily: 'Roboto'
      ),
    );
  }
}
