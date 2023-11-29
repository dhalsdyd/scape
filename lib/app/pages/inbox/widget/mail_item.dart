import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/inbox/widget/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MailItem extends StatelessWidget {
  const MailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const InboxDetailPage());
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ScapeColors.Gray60),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                children: [
                  Shimmer.fromColors(
                      baseColor: ScapeColors.Gray20,
                      highlightColor: ScapeColors.Gray40,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text("A", style: ScapeTextTheme.Text4_BOLD),
                        ),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                            baseColor: ScapeColors.Gray20,
                            highlightColor: ScapeColors.Gray40,
                            child: const Text("광고성 메일",
                                style: ScapeTextTheme.Text3_MEDIUM)),
                        const SizedBox(height: 4),
                        Shimmer.fromColors(
                            baseColor: ScapeColors.Gray20,
                            highlightColor: ScapeColors.Gray40,
                            child: const Text("광고성 메일을 차단하여 더욱 깨끗한 메일함을 유지하세요.",
                                style: ScapeTextTheme.Text1)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
