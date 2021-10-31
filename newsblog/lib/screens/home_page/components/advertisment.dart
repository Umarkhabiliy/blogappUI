import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class Advertisment extends StatelessWidget {
  const Advertisment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width -60.w,
      // height: 260.h,
      child: Column(
        children: [
          Divider(thickness: 1,color: Colors.grey.shade400,),
          Align(alignment: Alignment.centerRight,
            child: TextWidget(
              text: "Advertisment",size: 15.sp,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 200,child: Image.network("https://source.unsplash.com/random",fit: BoxFit.cover,)),
           Divider(thickness: 1,color: Colors.grey.shade400,),
        ],
      ),
    );
  }
}
