import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
   TabBarWidget({Key? key}) : super(key: key);
List<String> tabs = ["Latest", "Business", "Sport", "Technology"];
  @override
  Widget build(BuildContext context) {
    
    return TabBar(
      tabs: [

        ...List.generate(
            4,
            (index) => Tab(
                  text: tabs[index],
                )
        )
      ],
    );
  }
}
