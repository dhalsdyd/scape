import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountDetailPage extends GetView<HomePageController> {
  const AccountDetailPage({super.key});

  Widget credentialCard(String assetName, String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ScapeColors.Gray60),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(children: [
              SvgPicture.asset("assets/icons/$assetName.svg"),
              const SizedBox(width: 8),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "$title: ",
                    style: ScapeTextTheme.Text3_MEDIUM.copyWith(
                        fontWeight: FontWeight.bold)),
                TextSpan(text: content, style: ScapeTextTheme.Text3_MEDIUM)
              ]))
            ]),
          ),
          Container(
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
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/share.svg",
              width: 20,
              height: 20,
            ),
            onPressed: () {},
          )
        ],
        title: const Text(
          'Account',
          style: ScapeTextTheme.Text4_BOLD,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Credentials', style: ScapeTextTheme.Text4_BOLD),
              SvgPicture.asset("assets/icons/edit.svg")
            ],
          ),
          const SizedBox(height: 12),
          credentialCard("mail_filled", "Email", controller.mail.value),
          const SizedBox(height: 12),
          credentialCard(
              "small_key_filled", "Password", controller.password.value),
          const SizedBox(height: 32),
          const Text('Logs', style: ScapeTextTheme.Text4_BOLD),
          const SizedBox(height: 8),
          logCard(),
          const SizedBox(height: 32),
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
                const Text('Delete Account', style: ScapeTextTheme.Text3),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
