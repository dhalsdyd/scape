import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/root/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RootPage extends GetView<RootPageController> {
  const RootPage({Key? key}) : super(key: key);

  _bottomNavigationBarItem(String assetName, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(assetName),
      label: label,
      activeIcon: SvgPicture.asset(
        assetName,
        color: FGBPColors.Primary10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.pages[0],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          items: [
            _bottomNavigationBarItem('assets/icons/home.svg', 'Home'),
            _bottomNavigationBarItem('assets/icons/virtual.svg', 'Virtual'),
            _bottomNavigationBarItem('assets/icons/mail.svg', 'Mail/Phone'),
            _bottomNavigationBarItem('assets/icons/privacy.svg', 'Privacy'),
          ],
          selectedItemColor: FGBPColors.Primary10,
          unselectedItemColor: FGBPColors.Gray10,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedLabelStyle: FGBPTextTheme.regular12,
        ),
      ),
    );
  }
}
