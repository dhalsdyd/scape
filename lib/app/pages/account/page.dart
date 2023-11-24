
import 'package:firebase_getx_boilerplate/app/pages/account/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/theme/text_theme.dart';

class AccountDetailPage extends GetView<AccountDetailController> {
  const AccountDetailPage({super.key});

  Widget credentialCard(String assetName,String title, String content) {
    return Row(
      children: [
        Expanded(
          child: Row(children: [
            SvgPicture.asset("assets/icons/$assetName.svg"),
            const SizedBox(width: 8),
            Text.rich(TextSpan(children: [
              TextSpan(text: "$title: ", style: FGBPTextTheme.Text3_MEDIUM.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(text: content, style: FGBPTextTheme.Text3_MEDIUM)
          
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
              style: FGBPTextTheme.Text1,
            ),
          ),
        )
      ],
    );
  }

  Widget logCard() {
    return ListView.builder(itemBuilder: (context, index) {
      return Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ], 
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Credentials', style: FGBPTextTheme.Text4_BOLD),
              SvgPicture.asset("assets/icons/edit.svg")
            ],
          ),
          const SizedBox(height: 12),
          credentialCard("small_mail", "Email", controller.mail.value),
          const SizedBox(height: 12),
          credentialCard("key", "Password", controller.password.value),
          const SizedBox(height: 32),
          const Text('Logs', style: FGBPTextTheme.Text4_BOLD),
          const SizedBox(height: 8),
         
        ]),
      )),
    );
  }
}