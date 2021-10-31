import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/consts/weights.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  VoidCallback? onPressed;
  PageController? pageController;
  @override
  Size get preferredSize => Size.fromHeight(height);

  String? title;
  AppBarWidget(
      {this.height = kToolbarHeight,
      this.title,
      this.onPressed,
      this.pageController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,

      // titleSpacing: 30,
      backgroundColor: const Color(0xFF9E0306),
      leading: TextButton(
        onPressed: () {},
        child:  TextWidget(text:"Menu"),
      ),

      title: Text(
        title!,
        style:
            TextStyle(color: black700, fontWeight: weight700, fontSize: 20.sp),
      ),
    );
  }
}
