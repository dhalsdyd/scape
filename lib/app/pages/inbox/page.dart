import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/foundation.dart';
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
            Row(
              children: [
                const Text(
                  "Inbox",
                  style: ScapeTextTheme.Text4_BOLD,
                ),
                const Spacer(),
                if (kIsWeb)
                  GestureDetector(
                    onTap: controller.refreshEmail,
                    child: const Icon(
                      Icons.refresh,
                      size: 24,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 16),
            SegmentedTabControl(
                //indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
                tabPadding: const EdgeInsets.symmetric(vertical: 10),
                backgroundColor: ScapeColors.Gray40,
                textStyle: ScapeTextTheme.Text3_BOLD,
                tabTextColor: ScapeColors.Gray20,
                selectedTabTextColor: Colors.black,
                splashColor: ScapeColors.Primary20,
                splashHighlightColor: ScapeColors.Primary40,
                radius: const Radius.circular(50),
                controller: controller.tabController,
                tabs: const [
                  SegmentTab(label: "Mail"),
                  SegmentTab(label: "Phone"),
                ]),
            const SizedBox(height: 16),
            Expanded(
              child:
                  TabBarView(controller: controller.tabController, children: [
                controller.emailController.obx(
                    (_) => Obx(
                          () => RefreshIndicator(
                            onRefresh: controller.refreshEmail,
                            child: ListView.separated(
                                itemBuilder: ((context, index) => MailItem(
                                    emailMessage:
                                        controller.emailMessage[index])),
                                separatorBuilder: ((context, index) =>
                                    const SizedBox(height: 8)),
                                itemCount: controller.emailMessage.length),
                          ),
                        ),
                    onLoading: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: ScapeColors.Primary20,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text("Loading...", style: ScapeTextTheme.Text3_BOLD),
                      ],
                    )),
                const SizedBox(),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
