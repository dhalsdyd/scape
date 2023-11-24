import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/virtual/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/virtual/widget/identitiy_item.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VirtualPage extends GetView<VirtualPageController> {
  const VirtualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Virtual Identity",
                style: FGBPTextTheme.Text4_BOLD,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Generated Identity",
                style: FGBPTextTheme.Text3,
              ),
              const SizedBox(
                height: 8,
              ),
              DottedBorder(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(child: Text("🦕 Select Identity from below")),
                ),
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                color: FGBPColors.Primary40,
              ),
              const SizedBox(height: 16),
              const Text(
                "Available Identity",
                style: FGBPTextTheme.Text3,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    IdentitiyItem(
                      title: "Email",
                      subtitle: "Generate receive-only email",
                      color: 0xffD4DAE3,
                    ),
                    IdentitiyItem(
                      title: "Password",
                      subtitle: "Generate random strong password",
                      color: 0xffEAC5A4,
                    ),
                    IdentitiyItem(
                      title: "Basic Identify",
                      subtitle: "Generate name, gender, and address",
                      color: 0xffD2E7D0,
                    ),
                    IdentitiyItem(
                      title: "Phone Number",
                      subtitle: "Coming soon",
                      color: 0xffD3D3D3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              FGBPTextField(
                hintText: "Search Information Types",
                prefixIcon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              const SizedBox(height: 8),
            ]),
      ),
    ));
  }
}
