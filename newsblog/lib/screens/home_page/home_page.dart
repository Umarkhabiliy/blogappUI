import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/screens/home_page/components/advertisment.dart';
import 'package:newsblog/screens/home_page/components/gridview_widget.dart';
import 'package:newsblog/screens/home_page/components/main_container.dart';
import 'package:newsblog/widgets/custom_app_bar.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:  [
          AppBarWidget(
          actions: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.volume_up),
              label: TextWidget(text: "Live",size: 16.sp,weight: FontWeight.w600,),
              style: ElevatedButton.styleFrom(elevation: 0,primary: Colors.transparent),
            )
          ],
          title: "Top Stories",
        ),
          MainContainer(),
          Advertisment(),
          GridNews(),
        ],
      ),
    );
  }
}
