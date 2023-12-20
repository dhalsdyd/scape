import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/service/auth/service.dart';
import 'package:scape/app/pages/home/controller.dart';
import 'package:scape/app/pages/home/widget/account_item.dart';
import 'package:scape/app/pages/home/widget/tab_item.dart';
import 'package:scape/app/pages/root/controller.dart';
import 'package:scape/app/pages/virtual/controller.dart';
import 'package:scape/app/routes/route.dart';
import 'package:scape/app/widgets/bottom_modal.dart';
import 'package:scape/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScapeColors.Gray60,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AppbarItem(title: "Home"),
          const SizedBox(height: 16),
          const Text('Actions', style: ScapeTextTheme.Text4_BOLD),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionTabItem(
                  assetName: "add_mail",
                  label: "Create Mail",
                  onTap: () {
                    Get.find<RootPageController>().changePage(1);
                    Get.find<VirtualPageController>().makeEmail();
                  },
                ),
                ActionTabItem(
                    assetName: "virtual",
                    label: "Create VA",
                    onTap: () {
                      Get.find<RootPageController>().changePage(1);
                    }),
                ActionTabItem(
                  assetName: "add_document",
                  label: "Add Account",
                  onTap: () {
                    Get.toNamed(Routes.account_setting);
                  },
                ),
                ActionTabItem(
                    assetName: "inbox",
                    label: "Inbox",
                    onTap: () {
                      Get.find<RootPageController>().changePage(2);
                    }),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Accounts', style: ScapeTextTheme.Text4_BOLD),
              ScapeDropdownIcon(
                  icon: SvgPicture.asset("assets/icons/filter.svg"))
            ],
          ),
          const SizedBox(height: 8),
          Expanded(child: Obx(() {
            if (controller.accounts.isEmpty) {
              return Center(
                child: RefreshIndicator(
                  color: ScapeColors.Primary40,
                  onRefresh: controller.refreshAccount,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/empty.svg", width: 200),
                      const SizedBox(height: 16),
                      const Text(
                        "No Account",
                        style: ScapeTextTheme.Text4_BOLD,
                      ),
                    ],
                  ),
                ),
              );
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: RefreshIndicator(
                color: ScapeColors.Primary40,
                onRefresh: controller.refreshAccount,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      Account account = controller.accounts[index];
                      bool isSearched = controller.isSearched(index);

                      return AccountItem(
                        account_: account,
                        name: account.name,
                        account: account.fields[0].value,
                        password: account.fields[1].value,
                        isSearched: isSearched,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },

                    //physics: const BouncingScrollPhysics(),
                    itemCount: controller.accounts.length),
              ),
            );
          })),
          const SizedBox(height: 8),
          ScapeTextField(
            hintText: "Search Account",
            prefixIcon: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
            isShadow: true,
            controller: controller.searchController,
          ),
        ]),
      )),
    );
  }
}
