import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/privacy/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPage extends GetView<PrivacyPageController> {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Text(
            "Search Privacy Policy",
            style: FGBPTextTheme.Text4_BOLD,
          ),
        ]),
      ),
    ));
  }
}
