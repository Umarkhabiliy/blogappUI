import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsblog/consts/colors.dart';
// import 'package:newsblog/main/bottom_navigation_butto.dart';
import 'package:newsblog/screens/home_page/home_page.dart';
import 'package:newsblog/screens/mynews/my_news.dart';
import 'package:newsblog/screens/search/search_page.dart';
import 'package:newsblog/screens/video/video_page.dart';
import 'package:newsblog/widgets/custom_app_bar.dart';
import 'package:newsblog/widgets/custom_text_widget.dart';

class MainBlog extends StatefulWidget {
  MainBlog({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBlog> createState() => _MainBlogState();
}

class _MainBlogState extends State<MainBlog> {
  int curentPage = 0;

  List<Widget> pages = [
    const HomePage(),
     MyNews(),
    const VideoPage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
        BoxConstraints(maxWidth: size.width, maxHeight: size.height),
        designSize: const Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(backgroundColor: tabBorder,
        
        body: IndexedStack(
          index: curentPage,
          children: pages,
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: curentPage,
activeColor: applight,
          // CHANGE TO PROVIDER
          onTap: (index) {
            curentPage = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news_solid), label:"Top Stories"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news), label: "My News"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.compass), label: "Safari"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: "Settings"),
          ],
        )
        //  BottomNavBar(currentPage:curentPage ,),
        );
  }
}
