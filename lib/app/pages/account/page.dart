import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/account/controller.dart';
import 'package:scape/app/pages/account/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scape/app/pages/account/widget/underline_textfield.dart';
import 'package:scape/app/widgets/button.dart';

class AccountSettingPage extends GetView<AccountSettingPageController> {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ScapeColors.Gray60,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(() {
                        if (controller.faviconUrl.value != "") {
                          return Column(
                            children: [
                              Image.network(
                                controller.faviconUrl.value,
                                width: 50,
                                errorBuilder: (context, error, stackTrace) =>
                                    SvgPicture.network(
                                  controller.faviconUrl.value,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(controller.realServiceName.value,
                                  style: ScapeTextTheme.Text2_MEDIUM.copyWith(
                                      color: controller.faviconColor.value))
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: UnderLineTextField(
                            emoji: "",
                            controller: controller.serviceNameController,
                            hintText: "Service Name",
                            center: true,
                            editable: false),
                      ),
                      UnderLineTextField(
                          emoji: "📧",
                          controller: controller.emailController,
                          hintText: "Email/ID"),
                      //UnderLineTextField(controller.idController, "ID"),
                      UnderLineTextField(
                          emoji: "🔒",
                          controller: controller.passwordController,
                          hintText: "Password",
                          isPassword: true),
                      UnderLineTextField(
                          emoji: "👤",
                          controller: controller.nameController,
                          hintText: "Name"),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(const CustomFieldModal());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xffE6E6E6)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7.5, horizontal: 8),
                            child: Text(
                              "+ Account Information",
                              style: ScapeTextTheme.Text1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => ScapeKeyboardReactiveButton(
                      disabled: !controller.inputValidity,
                      onTap: controller.createAccount,
                      child: controller.obx((state) {
                        return Text("Save",
                            style: ScapeTextTheme.Text3_MEDIUM.copyWith(
                                color: Colors.white));
                      },
                          onLoading: const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: ScapeColors.Primary20,
                          ))),
                ),
              ],
            ),
          ),
        ));
  }
}
