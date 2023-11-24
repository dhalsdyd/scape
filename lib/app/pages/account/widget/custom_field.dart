import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFieldModal extends StatelessWidget {
  const CustomFieldModal({super.key});

  Widget textfieldWithIcon(
      String hintText, String iconName, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset("assets/icons/$iconName.svg"),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                ),
                const Text(
                  "Custom Field",
                  style: FGBPTextTheme.Text3_BOLD,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(height: 16),
            textfieldWithIcon("Field Name", "name", TextEditingController()),
            textfieldWithIcon("Field Name", "name", TextEditingController()),
            textfieldWithIcon("Field Name", "name", TextEditingController()),
            textfieldWithIcon("Field Name", "name", TextEditingController()),
            const SizedBox(height: 16),
            FGBPSmallTextButton(text: "Save", color: FGBPColors.Primary40)
          ],
        ),
      ),
    );
  }
}
