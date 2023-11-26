import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/account/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/mock/data.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widget/account_item.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widget/tab_item.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Actions', style: FGBPTextTheme.Text4_BOLD),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ActionTabItem(assetName: "add_mail", label: "Create Mail"),
              const ActionTabItem(assetName: "virtual", label: "Create VA"),
              ActionTabItem(
                assetName: "add_document",
                label: "Add Account",
                onTap: () {
                  Get.to(() => const AccountSettingPage());
                },
              ),
              const ActionTabItem(assetName: "inbox", label: "Inbox"),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Accounts', style: FGBPTextTheme.Text4_BOLD),
              SvgPicture.asset("assets/icons/filter.svg")
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AccountItem(
                    image: accountMockData[index]['image'],
                    name: accountMockData[index]["name"],
                    account: accountMockData[index]["account"],
                    password: accountMockData[index]["password"],
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: accountMockData.length,
          )),
          const SizedBox(height: 8),
          FGBPTextField(
            hintText: "Search Account",
            prefixIcon: SvgPicture.asset("assets/icons/search.svg"),
          ),
          const SizedBox(height: 8),
        ]),
      )),
    );
  }
}
