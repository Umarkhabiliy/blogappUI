import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/widgets/custom_app_bar.dart';
import 'package:newsblog/widgets/custom_button.dart';
import 'package:newsblog/widgets/custom_tffd.dart';

class UpdatePostsPage extends StatefulWidget {
  const UpdatePostsPage({Key? key}) : super(key: key);

  @override
  _UpdatePostsPageState createState() => _UpdatePostsPageState();
}

class _UpdatePostsPageState extends State<UpdatePostsPage> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();
  TextEditingController imageEditingController = TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarWidget(
                title: "Update",
                actions: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                children: [
                                  Form(
                                      child: Column(
                                    children: [
                                      TextFormFieldWidget(
                                          hinttext: "title",
                                          textEditingController:
                                              titleEditingController),
                                      TextFormFieldWidget(
                                          hinttext: "content",
                                          textEditingController:
                                              contentEditingController),
                                      TextFormFieldWidget(
                                          hinttext: "content",
                                          textEditingController:
                                              imageEditingController),
                                      TextFormFieldWidget(
                                          hinttext: "content",
                                          textEditingController:
                                              categoryEditingController),
                                      ElButtonWidget(
                                        text: "Update",
                                        width: 343.w,
                                        height: 56.h,
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
                                                          .text
                                                },
                                                options: Options(
                                                    contentType:
                                                        'application/json'));
                                            titleEditingController.clear();
                                            contentEditingController.clear();
                                            imageEditingController.clear();
                                            categoryEditingController.clear();
                                            Navigator.pop(context);
                                            setState(() {});
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor:
                                                    Colors.redAccent,
                                                content: Text("XATO BOR !"),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ))
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldWidget(
                  hinttext: "Title",
                  textEditingController: titleEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldWidget(
                  hinttext: "Contnet",
                  textEditingController: contentEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldWidget(
                  hinttext: "Image",
                  textEditingController: imageEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldWidget(
                  hinttext: "Category",
                  textEditingController: categoryEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElButtonWidget(
                  width: 343,
                  height: 56,
                  onPressed: () async {
                    try {
                      await Dio().post(
                        'http://192.168.1.133:4000/news/add',
                        data: {
                          "title": titleEditingController.text,
                          "content": contentEditingController.text,
                          "image": imageEditingController.text,
                          "category": categoryEditingController.text,
                        },
                      );
                      titleEditingController.clear();
                      contentEditingController.clear();
                      imageEditingController.clear();
                      categoryEditingController.clear();
                      Navigator.pop(context);
                      setState(() {});
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text("XATO BOR !"),
                        ),
                      );
                    }
                  },
                  text: "Update",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/**ElevatedButton(
                                  child: const Text("UPDATE POST"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () async {
                                    try {
                                      await Dio().patch(
                                        'http://localhost:3000/news/update',
                                        data: {
                                          "title": _titleController.text,
                                          "newContent": _contentController.text,
                                        },
                                        options: Options(
                                            contentType: 'application/json'),
                                      );
                                      _titleController.clear();
                                      _contentController.clear();
                                      _imageController.clear();
                                      _categoryController.clear();
                                      Navigator.pop(context);
                                      setState(() {});
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.redAccent,
                                          content: Text("XATO BOR !"),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }); */