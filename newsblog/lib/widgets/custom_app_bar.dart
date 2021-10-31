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
   final actions;
   PreferredSizeWidget? bottom;
  @override
  Size get preferredSize => Size.fromHeight(height);

  String? title;
  AppBarWidget(
      {this.height = kToolbarHeight,
      this.title,
      this.onPressed,
      this.pageController,
      this.actions,
      this.bottom,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      centerTitle: true,
      elevation: 0,
      leadingWidth: 70.w,
      // titleSpacing: 30,
      backgroundColor: applight,
      leading: TextButton(
        onPressed: () {},
        child: TextWidget(
          text: "Menu",
          size: 18.sp,
        ),
      ),

      title: TextWidget(
        text: title!,
        color: buttonText,
        size: 20.sp,
        weight: FontWeight.w700,
      ),
      actions: actions,
    );
  }
}
