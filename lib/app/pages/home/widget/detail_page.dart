import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scape/app/routes/route.dart';
import 'package:share_plus/share_plus.dart';

class AccountDetailPage extends GetView<HomePageController> {
  const AccountDetailPage({super.key});

  Widget credentialCard(String assetName, String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                // SvgPicture.asset("assets/icons/$assetName.svg"),
                // const SizedBox(width: 8),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "$title: ", style: ScapeTextTheme.Text3_MEDIUM),
                  TextSpan(text: content, style: ScapeTextTheme.Text3)
                ]))
              ]),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              log("copy : $content");
              Clipboard.setData(ClipboardData(text: content));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE6E6E6)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
                child: Text(
                  "Copy",
                  style: ScapeTextTheme.Text1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget logCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ScapeColors.Gray60),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.logMockData.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.logMockData[index]["date"],
                    style: ScapeTextTheme.Text1.copyWith(
                        color: ScapeColors.Gray20)),
                Text(
                  controller.logMockData[index]["data"],
                  style: ScapeTextTheme.Text2,
                )
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/share.svg",
              width: 20,
              height: 20,
            ),
            onPressed: () {
              Share.share("https://scape.page.link/1234567890");
            },
          )
        ],
        title: Text(
          controller.selectAccount.value!.name,
          style: ScapeTextTheme.Text4_BOLD,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Credentials', style: ScapeTextTheme.Text4_BOLD),
                GestureDetector(
                    onTap: () {
                      Map data = {
                        "serviceName": controller.selectAccount.value!.name,
                        "Email":
                            controller.selectAccount.value!.fields[0].value,
                        "Password":
                            controller.selectAccount.value!.fields[1].value,
                        "Name": controller.selectAccount.value!.fields[2].value,
                      };

                      for (int i = 3;
                          i < controller.selectAccount.value!.fields.length;
                          i++) {
                        data[controller.selectAccount.value!.fields[i].name] =
                            controller.selectAccount.value!.fields[i].value;
                      }

                      data["modify"] = true;

                      Get.toNamed(Routes.account_setting, arguments: data);
                    },
                    child: SvgPicture.asset("assets/icons/edit.svg"))
              ],
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return credentialCard(
                    controller.selectAccount.value!.fields[index].emoji,
                    controller.selectAccount.value!.fields[index].name,
                    controller.selectAccount.value!.fields[index].value);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: controller.selectAccount.value!.fields.length,
            ),
            const SizedBox(height: 32),
            // const Text('Logs', style: ScapeTextTheme.Text4_BOLD),
            // const SizedBox(height: 8),
            // logCard(),
            //const SizedBox(height: 32),
            Text('Danger Zone',
                style: ScapeTextTheme.Text4_BOLD.copyWith(color: Colors.red)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xfff7f7f7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ScapeColors.Gray60),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/trash.svg"),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          buttonColor: ScapeColors.Primary20,
                          titlePadding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          title: "Delete Account",
                          content: const Text(
                              "Are you sure you want to delete this account?"),
                          textConfirm: "Delete",
                          textCancel: "Cancel",
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            controller.deleteAccount();
                            Get.back();
                          });
                    },
                    child: const Text('Delete Account',
                        style: ScapeTextTheme.Text3),
                  ),
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
