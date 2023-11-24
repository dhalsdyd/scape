import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionTabItem extends StatelessWidget {
  const ActionTabItem(
      {super.key, required this.assetName, required this.label});

  final String assetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
  
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset("assets/icons/$assetName.svg",
                color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: FGBPTextTheme.Text1
        ),
      ],
    );
  }
}
