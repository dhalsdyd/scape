import 'package:get/get.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/widgets/button.dart';
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
      style: ScapeTextTheme.Text3,
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
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.white.withOpacity(1),
      surfaceTintColor: Colors.white.withOpacity(1),
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
                  style: ScapeTextTheme.Text3_BOLD,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 16),
            textfieldWithIcon("Field Name", "name", TextEditingController()),
            textfieldWithIcon("Value", "value", TextEditingController()),
            textfieldWithIcon("Hide Preview", "show", TextEditingController()),
            textfieldWithIcon(
                "Description (Option)", "description", TextEditingController()),
            const SizedBox(height: 16),
            const ScapeSmallTextButton(
                text: "Save", color: ScapeColors.Primary40)
          ],
        ),
      ),
    );
  }
}
