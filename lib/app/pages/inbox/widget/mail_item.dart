import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/data/models/email.dart';
import 'package:scape/app/pages/inbox/widget/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MailItem extends StatelessWidget {
  const MailItem({super.key, required this.emailMessage});

  final EmailMessage emailMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => InboxDetailPage(emailMessage: emailMessage));
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
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("A", style: ScapeTextTheme.Text4_BOLD),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                            baseColor: ScapeColors.Gray20,
                            highlightColor: ScapeColors.Gray40,
                            child: Text(emailMessage.text,
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
