import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/inbox/controller.dart';
import 'package:scape/app/pages/inbox/widget/mail_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends GetView<InboxPageController> {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Inbox",
              style: ScapeTextTheme.Text4_BOLD,
            ),
            const SizedBox(height: 16),
            SegmentedTabControl(
                backgroundColor: ScapeColors.Gray40,
                textStyle: ScapeTextTheme.Text3_BOLD,
                tabTextColor: ScapeColors.Gray20,
                selectedTabTextColor: Colors.black,
                splashColor: ScapeColors.Primary20,
                splashHighlightColor: ScapeColors.Primary40,
                radius: const Radius.circular(18),
                controller: controller.tabController,
                tabs: const [
                  SegmentTab(label: "Mail"),
                  SegmentTab(label: "Phone"),
                ]),
            const SizedBox(height: 16),
            Expanded(
              child:
                  TabBarView(controller: controller.tabController, children: [
                ListView(
                  shrinkWrap: true,
                  children: const [
                    MailItem(),
                    MailItem(),
                    MailItem(),
                  ],
                ),
                Container(),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
