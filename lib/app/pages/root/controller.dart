import 'package:scape/app/pages/home/page.dart';
import 'package:scape/app/pages/inbox/page.dart';
import 'package:scape/app/pages/privacy/page.dart';
import 'package:scape/app/pages/virtual/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPageController extends GetxController with StateMixin {
  static RootPageController get to =>
      Get.find<RootPageController>(); // add this line

  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;
  set pageIndex(int value) => _pageIndex.value = value;

  List<Widget> pages = [
    const HomePage(),
    const VirtualPage(),
    const InboxPage(),
    const PrivacyPage()
  ];

  void changePage(int index) {
    _pageIndex.value = index;
    update();
  }
}
