import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {super.key,
      this.image,
      required this.name,
      required this.account,
      this.password});

  final String? image;
  final String name;
  final String account;
  final String? password;

  Widget profileImage() {
    if (image != null) {
      return Container(width: 36,
        height: 36, decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Image.network(image!)));
    } else {
      return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(name[0],
              style: FGBPTextTheme.Text4_BOLD.copyWith(color: Colors.white)),
        ),
      );
    }
  }

  Widget iconWithText(String assetName, String label) {
    return Row(
      children: [
        SvgPicture.asset("asset/icons/$assetName.svg"),
        const SizedBox(width: 2),
        Text(label,
            style: FGBPTextTheme.Text1.copyWith(color: const Color(0xff8f8f8f))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  profileImage(),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: FGBPTextTheme.Text3_MEDIUM),
                      const SizedBox(height: 4),
                      iconWithText("small_mail", account),
                      const SizedBox(height: 2),
                      if (password != null) iconWithText("small_lock", password!),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE6E6E6)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical:7.5,horizontal:8),
                child: Text("Copy",style: FGBPTextTheme.Text1,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
