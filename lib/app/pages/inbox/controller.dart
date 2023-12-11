import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scape/app/data/models/email.dart';
import 'package:scape/app/data/module/email/module.dart';

class InboxPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final EmailController emailController = Get.find<EmailController>();

  List<EmailMessage> get emailMessage => emailController.emailMessages;

  final Completer<void> refreshCompleter = Completer<void>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> refreshEmail() async {
    await emailController.getEmailMessages();
  }
}
