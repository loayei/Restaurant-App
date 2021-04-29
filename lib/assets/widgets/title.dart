import 'package:flutter/material.dart';

import '../helpers/style.dart';

class CustomText extends StatelessWidget {
  final Color color;
  final String text;
  final FontWeight weight;
  final double size;

  CustomText({this.color,@required this.text, this.weight, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size ?? 16, color: color ?? black, fontWeight: weight?? FontWeight.normal),);
  }
}
