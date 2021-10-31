import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/model/news_model.dart';
import 'package:newsblog/screens/mynews/components/appbar_widget.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class MyNews extends StatelessWidget {
  MyNews({Key? key}) : super(key: key);
  List<String> tabs = ["Latest", "Business", "Sport", "Technology"];
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidgetNews(),
              StreamBuilder(
        stream: _fetchData(),
        builder: (context, AsyncSnapshot<List<NewsModel>> snap) {
              if (snap.hasData) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snap.data!.length,
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
                                  snap.data![index].image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
    
                                    TextWidget(
                                      text: snap.data![index].title.toString(),
                                      color: black700,
                                      size: 18.sp,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: snap.data![index].createdAt.toString().substring(0,11),
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
              } else if (snap.hasError) {
                return Text(snap.error.toString());
              } else {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 20.0,
                  ),
                );
              }
        },
      ),
            ],
          )
    );
  }

  Stream<List<NewsModel>> _fetchData() async* {
    try {
      var response = await Dio().get('http://192.168.1.133:4000/news');
      yield (response.data as List).map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Fetch data error");
    }
  }
}
