import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/data/service/auth/service.dart';
import 'package:scape/app/routes/route.dart';

class AppbarItem extends StatelessWidget {
  const AppbarItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: ScapeTextTheme.Text6_BOLD,
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              //bottom modal sheet
              Get.bottomSheet(
                BottomModal(),
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                ignoreSafeArea: true,
              );
            },
            child: const CircleAvatar(
              backgroundColor: ScapeColors.Primary50,
              foregroundImage: AssetImage("assets/icons/scape.png"),
              radius: 16,
            ))
      ],
    );
  }
}

class BottomModal extends StatelessWidget {
  const BottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: 0.9,
        initialChildSize: 0.9,
        minChildSize: 0.0,
        builder: ((context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("OK",
                          style: ScapeTextTheme.Text4_BOLD.copyWith(
                              color: Colors.transparent)),
                      const Text(
                        "Account",
                        style: ScapeTextTheme.Text4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text("OK",
                            style: ScapeTextTheme.Text4_BOLD.copyWith(
                                color: ScapeColors.Primary20)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // 프로필
                  const Row(children: [
                    CircleAvatar(
                      backgroundColor: ScapeColors.Primary50,
                      foregroundImage: AssetImage("assets/icons/scape.png"),
                      radius: 16,
                    ),
                    SizedBox(width: 8),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scape",
                            style: ScapeTextTheme.Text3,
                          ),
                        ])
                  ]),
                  const SizedBox(height: 16),
                  Text("Scape does not save your personal information at once",
                      style: ScapeTextTheme.Text2.copyWith(
                          color: ScapeColors.Gray20)),
                  const SizedBox(height: 16),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      tileColor: ScapeColors.Primary20,
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title: Text("Logout",
                          style: ScapeTextTheme.Text3_BOLD.copyWith(
                              color: Colors.white)),
                      onTap: () {
                        Get.back();
                        Get.find<AuthService>().logout();
                        Get.offAllNamed(Routes.login);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 계정설정
                  Expanded(
                    child: const SizedBox(),
                  ),

                  const Text("Version 1.0.0", style: ScapeTextTheme.Text2),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "개인정보처리방침", style: ScapeTextTheme.Text2),
                    TextSpan(text: " | ", style: ScapeTextTheme.Text2),
                    TextSpan(text: "이용약관", style: ScapeTextTheme.Text2),
                  ])),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        }));
  }
}
