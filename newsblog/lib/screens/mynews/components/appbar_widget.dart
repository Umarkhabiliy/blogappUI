import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/widgets/custom_app_bar.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class AppbarWidgetNews extends StatelessWidget {
  AppbarWidgetNews({Key? key, this.tabController}) : super(key: key);
  TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      actions:[ TextButton(
        child: TextWidget(
          text: "Edit",size: 18.sp,
          color: buttonText,
        ),
        onPressed: () {},
      ),],
      title: "My News",
    );
  }
}
