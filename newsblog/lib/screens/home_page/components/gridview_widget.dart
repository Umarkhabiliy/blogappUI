import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class GridNews extends StatelessWidget {
  const GridNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height.h,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRect(
              child: Container(
                color: const Color(0xFFF3F3F3),
                child: Column(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width,
                    height: 100,
                      child: Image.network(
                        "https://source.unsplash.com/random",fit: BoxFit.cover,
                      ),
                    ),
                    //  Align(alignment: Alignment.center,child: Divider(color:Colors.red,thickness: 2,))
                    TextWidget(
                      text: "Science & Environment",
                      color: applight,
                      size: 14.sp,
                      weight: FontWeight.normal,
                    ),
                    TextWidget(
                      text: "A really simple guide to climate change",
                      color: black700,
                      size: 16.sp,
                      weight: FontWeight.w400,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
