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

  Widget _buildGeneratedIdentity() {
    return const IdentityDetailItem(
        title: "Email",
        subtitle: "Generate receive-only email",
        color: 0xffD3D3D3);

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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const IdentitiyItem(
                      title: "Email",
                      subtitle: "Generate receive-only email",
                      color: 0xffD4DAE3,
                    ),
                    const IdentitiyItem(
                      title: "Password",
                      subtitle: "Generate random strong password",
                      color: 0xffEAC5A4,
                    ),
                    const IdentitiyItem(
                      title: "Basic Identify",
                      subtitle: "Generate name, gender, and address",
                      color: 0xffD2E7D0,
                    ),
                    const IdentitiyItem(
                      title: "Phone Number",
                      subtitle: "Coming soon",
                      color: 0xffD3D3D3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ScapeTextField(
                hintText: "Search Information Types",
                prefixIcon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              const SizedBox(height: 8),
            ]),
      ),
    ));
  }
}
