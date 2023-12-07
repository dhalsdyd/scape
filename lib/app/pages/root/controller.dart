import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/module/account/module.dart';
import 'package:scape/app/data/module/email/module.dart';
import 'package:scape/app/pages/home/page.dart';
import 'package:scape/app/pages/inbox/page.dart';
import 'package:scape/app/pages/privacy/page.dart';
import 'package:scape/app/pages/virtual/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPageController extends GetxController with StateMixin {
  static RootPageController get to =>
      Get.find<RootPageController>(); // add this line

  //PAGE INDEX

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

  // MODULES INIT
  final AccountController accountController = Get.find<AccountController>();
  final EmailController emailController = Get.find<EmailController>();

  @override
  void onInit() async {
    super.onInit();
    //await accountController.getAccount();
    //await emailController.getEmailMessages();
  }
}
