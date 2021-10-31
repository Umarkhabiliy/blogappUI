
import 'package:flutter/material.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class OutButtonIcon extends StatelessWidget {
  ImageIcon icons = const ImageIcon(AssetImage("assets/icons/fromcalen.png"));
  VoidCallback onPressed;
  String? label;
  double? height;
  double? width;
  double? textWidth;
  OutButtonIcon(
      {required this.icons,
      required this.onPressed,
      this.label,
      this.height,
      this.width,
      this.textWidth,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            primary: tabBorder,
            minimumSize: Size(width!, height!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        icon: icons,
        label: TextWidget(
          color: tabBorder,
          text: label,
          weight: FontWeight.w400,
          size: textWidth,
        ));
  }
}
