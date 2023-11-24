import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/inbox/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/inbox/widget/mail_item.dart';
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
              style: FGBPTextTheme.Text4_BOLD,
            ),
            const SizedBox(height: 16),
            SegmentedTabControl(
                backgroundColor: FGBPColors.Gray40,
                textStyle: FGBPTextTheme.Text3_BOLD,
                tabTextColor: FGBPColors.Gray20,
                selectedTabTextColor: Colors.black,
                splashColor: FGBPColors.Primary20,
                splashHighlightColor: FGBPColors.Primary40,
                radius: Radius.circular(18),
                controller: controller.tabController,
                tabs: [
                  SegmentTab(label: "Mail"),
                  SegmentTab(label: "Notification"),
                ]),
            const SizedBox(height: 16),
            Expanded(
              child:
                  TabBarView(controller: controller.tabController, children: [
                ListView(
                  shrinkWrap: true,
                  children: [
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
