import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/mock/data.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widget/account_item.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widget/tab_item.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Actions', style: FGBPTextTheme.Text4_BOLD),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionTabItem(assetName: "add_mail", label: "Create Mail"),
              ActionTabItem(assetName: "virtual", label: "Create VA"),
              ActionTabItem(assetName: "add_document", label: "Add Account"),
              ActionTabItem(assetName: "inbox", label: "Inbox"),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Accounts', style: FGBPTextTheme.Text4_BOLD),
          const SizedBox(height: 8),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AccountItem(
                    image: accountMockData[index]['image'] ?? null,
                    name: accountMockData[index]["name"],
                    account: accountMockData[index]["account"],
                    password: accountMockData[index]["password"] ?? null,
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
          FGBPTextField(hintText: "Search Account")
        ]),
      )),
    );
  }
}
