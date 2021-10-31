
import 'package:flutter/material.dart';
import 'package:newsblog/consts/colors.dart';

class TextWidget extends StatelessWidget {
  String? text;
  double? size;
  FontWeight? weight;
  Color? color;
  TextWidget(
      {this.text,
      this.size = 12.0,
      this.weight = FontWeight.w400,
      this.color = black700,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontSize: size, fontWeight: weight,color: color),
    );
  }
}
