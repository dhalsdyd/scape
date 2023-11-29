import 'package:scape/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScapeSnackBar {
  static void open(
    String title, {
    Color backgroundColor = ScapeColors.mainColor,
    Color textColor = Colors.white,
  }) {
    Get.rawSnackbar(
      titleText: Text(title,
          style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1,
              color: textColor)),
      messageText: Container(),
      backgroundColor: backgroundColor,
      borderRadius: 12,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      animationDuration: const Duration(milliseconds: 800),
    );
  }
}

class ScapeErrorSnackBar {
  void open(String title, {String? message}) {
    ScapeSnackBar.open(
      title,
      backgroundColor: ScapeColors.grey,
      textColor: Colors.white,
    );
  }
}
