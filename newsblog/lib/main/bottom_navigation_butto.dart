import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo), label: "Media"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.compass), label: "Safari"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: "Settings"),
      ],
    );
  }
}

// Scaffold(
//       backgroundColor: Color(0xFFEEEEEE),
//       body: currentTab[provider.currentIndex],
//       bottomNavigationBar: CupertinoTabBar(
//         currentIndex: provider.currentIndex,
//         onTap: (index) {
//           provider.setIndex = index;
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.home), label: "home"),
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.photo), label: "Media"),
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.settings), label: "Settings"),
//         ],
//       ),
//     );