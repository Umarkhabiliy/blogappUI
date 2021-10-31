import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/main/mainblog.dart';

void main() => runApp(const BlogApp());

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // ScreenUtil.init(
    //     BoxConstraints(maxWidth: size.width, maxHeight: size.height),
    //     designSize: const Size(360, 690),
    //     orientation: Orientation.portrait);
    return 
    
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:  MainBlog(),
    );
  }
}
