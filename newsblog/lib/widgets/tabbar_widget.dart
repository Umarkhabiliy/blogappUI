import 'package:flutter/material.dart';
import 'package:newsblog/consts/colors.dart';

class TabBarWidget extends StatelessWidget {
  List<Widget>? tabs;
  var controller;
  var width;
  double? brRadius;
  TabBarWidget({
    this.tabs,
    this.controller,
    this.width,
    this.brRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: controller,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.black,
        indicator: BoxDecoration(
          border: Border.all(color: sliderBorder, width: width),
          borderRadius: BorderRadius.circular(brRadius!),
        ),
        tabs: tabs!);
  }
}
