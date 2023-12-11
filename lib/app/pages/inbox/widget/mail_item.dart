import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/data/models/email.dart';
import 'package:scape/app/pages/inbox/widget/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      color: ScapeColors.Gray40,
                    ),
                    child: Center(
                        child: Text(emailMessage.from[0],
                            style: ScapeTextTheme.Text3_MEDIUM.copyWith(
                                color: ScapeColors.Gray10))),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(emailMessage.subject,
                            style: ScapeTextTheme.Text3_MEDIUM),
                        const SizedBox(height: 4),
                        Text(emailMessage.text,
                            style: ScapeTextTheme.Text1.copyWith(
                                color: ScapeColors.Gray20),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
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
