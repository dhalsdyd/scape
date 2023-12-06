import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/login/controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset("assets/icons/security.svg"),
                  const Text(
                    'Scape',
                    style: ScapeTextTheme.Text5_BOLD,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Let's save the world",
                    style: ScapeTextTheme.Text4,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: controller.loginWithGoogle,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/google.svg"),
                      const SizedBox(width: 12),
                      const Text("Login With Google",
                          style: ScapeTextTheme.Text4_BOLD),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
