import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/virtual/controller.dart';
import 'package:scape/app/pages/virtual/widget/identitiy_item.dart';
import 'package:scape/app/widgets/button.dart';
import 'package:scape/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VirtualPage extends GetView<VirtualPageController> {
  const VirtualPage({super.key});

  Widget _buildGeneratedIdentity() {
    return Obx(() {
      if (controller.selected_list.value.isEmpty) {
        return DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          color: ScapeColors.Primary40,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(child: Text("🦕 Select Identity from below")),
          ),
        );
      }
      return Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                Virtual item = controller.selected_list.value[index];
                return IdentityDetailItem(
                  title: item.title,
                  subtitle: item.subtitle,
                  color: item.color,
                  content: item.content,
                  onTap: () {
                    controller.onDone(item);
                  },
                );
              }),
              itemCount: controller.selected_list.value.length),
          const SizedBox(height: 8),
          ScapeSmallTextButton(text: "Save", onTap: controller.saveIdentity),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Virtual Identity",
                    style: ScapeTextTheme.Text4_BOLD,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Generated Identity",
                    style: ScapeTextTheme.Text3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildGeneratedIdentity(),
                  const SizedBox(height: 16),
                  const Text(
                    "Available Identity",
                    style: ScapeTextTheme.Text3,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.virtual_list.length,
                      itemBuilder: ((context, index) {
                        Virtual item = controller.virtual_list[index];
                        return IdentitiyItem(
                          title: item.title,
                          subtitle: item.subtitle,
                          color: item.color,
                          onTap: () {
                            controller.onSelected(item);
                          },
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ScapeTextField(
                    hintText: "Search Information Types",
                    prefixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                  const SizedBox(height: 8),
                ]),
            Obx(() {
              if (controller.emailController.creatingMail.value) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: ScapeColors.Primary20,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text("Creating Strong Mail...",
                        style: ScapeTextTheme.Text3_MEDIUM),
                  ],
                );
              }
              return const SizedBox();
            })
          ],
        ),
      ),
    ));
  }
}
