import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/account/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

  Widget textfieldWithUnderLine(String hintText,
      {bool preffix = true,
      bool editable = true,
      bool isPassword = false,
      bool center = false}) {
    return Column(
      children: [
        Stack(
          children: [
            TextField(
              cursorColor: FGBPColors.Primary40,
              obscureText: isPassword,
              style: FGBPTextTheme.Text3,
              textAlign: center ? TextAlign.center : TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                focusColor: FGBPColors.Primary40,
                fillColor: FGBPColors.Primary40,
                hoverColor: FGBPColors.Primary40,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hintText,
                hintStyle: FGBPTextTheme.Text3.copyWith(color: Colors.grey),
                prefixIcon: preffix
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/small_mail.svg"),
                      )
                    : null,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: FGBPColors.Primary40, width: 2.0)),
              ),
            ),
            if (editable)
              Positioned(
                right: 0,
                bottom: 10,
                child: Row(
                  children: [
                    !isPassword
                        ? const SizedBox()
                        : Row(
                            children: [
                              SvgPicture.asset("assets/icons/show.svg"),
                              const SizedBox(width: 8),
                            ],
                          ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffE6E6E6)),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
                        child: Text(
                          "Edit",
                          style: FGBPTextTheme.Text1,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: textfieldWithUnderLine("Service Name",
                      preffix: false, center: true, editable: false),
                ),
                textfieldWithUnderLine("Email"),
                textfieldWithUnderLine("ID"),
                textfieldWithUnderLine("Password", isPassword: true),
                textfieldWithUnderLine("Name"),
                GestureDetector(
                  onTap: () {
                    Get.dialog(CustomFieldModal());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xffE6E6E6)),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
                      child: Text(
                        "+ Account Information",
                        style: FGBPTextTheme.Text1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
