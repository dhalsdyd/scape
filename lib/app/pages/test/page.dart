import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/test/controller.dart';
import 'package:scape/app/widgets/button.dart';

class TestPage extends GetView<TestPageController> {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Test Page",
              style: ScapeTextTheme.Text4_BOLD,
            ),
            const SizedBox(height: 8),
            ScapeSmallTextButton(
              text: "Open Dialog",
              onTap: controller.openDialog,
            )
          ],
        ),
      ),
    ));
  }
}
