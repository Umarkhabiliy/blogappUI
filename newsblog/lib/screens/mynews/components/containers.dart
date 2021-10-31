import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (ctx, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "https://source.unsplash.com/random",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Baldwin speaks about",
                      color: black700,
                      size: 18.sp,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: "13h |",
                          color: tabBorder,
                        ),
                        TextWidget(
                          text: "Film",
                          color: applight,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
