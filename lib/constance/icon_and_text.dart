import 'package:flutter/material.dart';

import 'dimensions.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  // final Color color;
  final Color iconColor;

  const IconAndText({
    Key? key,
    required this.icon,
    required this.text,
    // required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.icon24,
        ),
        Text(text),
      ],
    );
  }
}
