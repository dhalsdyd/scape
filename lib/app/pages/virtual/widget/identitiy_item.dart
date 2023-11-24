import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdentitiyItem extends StatelessWidget {
  const IdentitiyItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.color});

  final String title;
  final String subtitle;

  final int color;

  // make color bolder
  int makeBolder(int color) {
    int r = color >> 16 & 0xFF;
    int g = color >> 8 & 0xFF;
    int b = color & 0xFF;

    r = (r * 0.8).round();
    g = (g * 0.8).round();
    b = (b * 0.8).round();

    return (0xFF << 24) | (r << 16) | (g << 8) | b;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: FGBPColors.Gray60),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              children: [
                Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: SvgPicture.asset("assets/icons/key_filled.svg",
                            color: Color(makeBolder(color))))),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: FGBPTextTheme.Text3_MEDIUM),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style:
                            FGBPTextTheme.Text1.copyWith(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
