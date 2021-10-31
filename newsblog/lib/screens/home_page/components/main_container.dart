import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220.sp,
          width: MediaQuery.of(context).size.width.sp,
          child: Image.network(
            "https://source.unsplash.com/random",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 70.h,
          color: const Color(0xFFF3F3F3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "THIS FIRST",
                size: 20.sp,color: black700,
              ),
              Row(
                children: [
                  TextWidget(
                    size: 14.sp,
                    text: "5 mins ago",
                    color: tabBorder,
                  ),SizedBox(width: 24.w,),
                  TextWidget(
                    size: 14.sp,
                    text: "Science & Enviroment",
                    color: applight,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
