import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/main/bottom_navigation_butto.dart';
import 'package:newsblog/widgets/custom_app_bar.dart';

class MainBlog extends StatelessWidget {
  const MainBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
        BoxConstraints(maxWidth: size.width, maxHeight: size.height),
        designSize: const Size(360, 690),
        orientation: Orientation.portrait);
    return 
    Scaffold(
      appBar: AppBarWidget(title: "Asd",),
      bottomNavigationBar:const BottomNavBar(),
    );
  }
}
