import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
import 'package:newsblog/model/news_model.dart';
import 'package:newsblog/screens/mynews/components/appbar_widget.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class MyNews extends StatefulWidget {
  MyNews({Key? key}) : super(key: key);

  @override
  State<MyNews> createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  List<String> tabs = ["Latest", "Business", "Sport", "Technology"];
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();
  TextEditingController imageEditingController = TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                                        text: snap.data![index].createdAt
                                            .toString()
                                            .substring(0, 11),
                                        color: tabBorder,
                                      ),
                                      TextWidget(
                                        text: "Film",
                                        color: applight,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return SizedBox(
                                                  child: SimpleDialog(
                                                    children: [
                                                      Form(
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    titleEditingController,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Title....",
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .multiline,
                                                                controller:
                                                                    contentEditingController,
                                                                maxLines: 3,
                                                                minLines: 1,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Content....",
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    imageEditingController,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Image....",
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    categoryEditingController,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Category....",
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        child: const Text(
                                                            "UPDATE POST"),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .green),
                                                        onPressed: () async {
                                                          try {
                                                            await Dio().patch(
                                                              'http://192.168.1.133:4000/news/update',
                                                              data: {
                                                                "title":
                                                                    titleEditingController
                                                                        .text,
                                                                "newContent":
                                                                    contentEditingController
                                                                        .text,
                                                              },
                                                              options: Options(
                                                                headers: {
                                                                  'Charset':
                                                                      'utf-8'
                                                                },
                                                                contentType:
                                                                    'application/json;charset=UTF-8',
                                                              ),
                                                            );
                                                            titleEditingController
                                                                .clear();
                                                            contentEditingController
                                                                .clear();
                                                            imageEditingController
                                                                .clear();
                                                            categoryEditingController
                                                                .clear();
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {});
                                                          } catch (e) {
                                                            print(e);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .redAccent,
                                                                content: Text(
                                                                    "XATO BOR !" +
                                                                        e.toString()),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            try {
                                              await Dio().delete(path);
                                            } catch (e) {}
                                          },
                                          icon: Icon(Icons.delete))
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
    ));
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
