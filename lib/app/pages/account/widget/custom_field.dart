import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFieldModal extends StatefulWidget {
  CustomFieldModal({super.key});

  @override
  State<CustomFieldModal> createState() => _CustomFieldModalState();
}

class _CustomFieldModalState extends State<CustomFieldModal> {
  final nameController = TextEditingController();
  final valueController = TextEditingController();
  bool show = false;
  final descriptionController = TextEditingController();

  @override
  void initState() {
    final Map? data = Get.arguments;
    if (data != null) {
      nameController.text = data["name"];
      valueController.text = data["value"];
      show = data["hidePreview"];
      descriptionController.text = data["description"];
      setState(() {});
    }
  }

  Widget textfieldWithIcon(
      String hintText, String iconName, TextEditingController controller,
      {bool obscureText = false, bool enable = true}) {
    return TextField(
      enabled: enable,
      controller: controller,
      obscureText: obscureText,
      style: ScapeTextTheme.Text3,
      cursorColor: ScapeColors.Primary30,
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

  Widget switchButton() {
    return Row(
      children: [
        Expanded(
          child: textfieldWithIcon("Hide Previdw", "show",
              TextEditingController(text: "Hide Preview"),
              enable: false),
        ),
        CupertinoSwitch(
          value: show,
          onChanged: (value) {
            show = value;
            setState(() {});
          },
          trackColor: ScapeColors.Gray60,
          activeColor: ScapeColors.Primary50,
          offLabelColor: ScapeColors.Gray60,
        )
      ],
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
            textfieldWithIcon("Field Name", "name", nameController),
            textfieldWithIcon("Value", "value", valueController),
            switchButton(),
            textfieldWithIcon(
                "Description (Option)", "description", descriptionController),
            const SizedBox(height: 16),
            ScapeSmallTextButton(
              text: "Save",
              color: ScapeColors.Primary40,
              onTap: () {
                if (nameController.text.isEmpty ||
                    valueController.text.isEmpty) {
                  return;
                }

                Get.back(result: {
                  "name": nameController.text,
                  "value": valueController.text,
                  "hidePreview": show,
                  "description": descriptionController.text,
                  "emoji": "assets/icons/custom.svg"
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
