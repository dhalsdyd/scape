import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
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
            border: Border.all(color: ScapeColors.Gray60),
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
                    Text(title, style: ScapeTextTheme.Text3_MEDIUM),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style:
                            ScapeTextTheme.Text1.copyWith(color: Colors.grey)),
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

class IdentityDetailItem extends StatefulWidget {
  const IdentityDetailItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.color});

  final String title;
  final String subtitle;
  final int color;

  @override
  State<IdentityDetailItem> createState() => _IdentityDetailItemState();
}

class _IdentityDetailItemState extends State<IdentityDetailItem> {
  bool isOpen = false;

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
            border: Border.all(color: ScapeColors.Gray60),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Color(widget.color),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/icons/key_filled.svg",
                                      color: Color(makeBolder(widget.color))))),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title,
                                  style: ScapeTextTheme.Text3_MEDIUM),
                              const SizedBox(height: 4),
                              Text(widget.subtitle,
                                  style: ScapeTextTheme.Text1.copyWith(
                                      color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/icons/trash.svg")
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                _buildDetailCard()
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildHeaderOptionIsOpen() {
    return IconButton(
        onPressed: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        icon: const Icon(Icons.keyboard_arrow_down));
  }

  Widget _buildHeaderOptionIsNotOpen() {
    return IconButton(
        onPressed: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        icon: const Icon(Icons.keyboard_arrow_up));
  }

  Widget _textfield(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
              color: ScapeColors.Primary40, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(title, style: ScapeTextTheme.Text2_MEDIUM),
        const SizedBox(width: 8),
        // textfield with underlin
        const Expanded(
          child: SizedBox(
            height: 24,
            child: TextField(
              style: ScapeTextTheme.Text2,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ScapeColors.Gray60),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ScapeColors.Primary40),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _dropdown(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
              color: ScapeColors.Primary40, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(title, style: ScapeTextTheme.Text2_MEDIUM),
        const SizedBox(width: 8),
        // textfield with underlin
        Expanded(
          child: SizedBox(height: 24, child: ScapeDropdownField()),
        )
      ],
    );
  }

  Widget _buildContentIsOpen() {
    return Column(
      children: [
        _textfield("Length : "),
        const SizedBox(height: 8),
        _dropdown("Includes"),
      ],
    );
  }

  Widget _buildDetailCard() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isOpen
                          ? _buildHeaderOptionIsOpen()
                          : _buildHeaderOptionIsNotOpen()),
                  const SizedBox(width: 10),
                  const Text("sdnjsndjsnjdnj", style: ScapeTextTheme.Text3_BOLD)
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
                padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
                child: Text(
                  "Copy",
                  style: ScapeTextTheme.Text1,
                ),
              ),
            )
          ],
        ),
        AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: isOpen ? _buildContentIsOpen() : Container())
      ],
    );

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(width: 32, height: 32, color: Colors.transparent),
              const SizedBox(width: 10),
              const Text("sdnjsndjsnjdnj", style: ScapeTextTheme.Text3_BOLD)
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
            padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
            child: Text(
              "Copy",
              style: ScapeTextTheme.Text1,
            ),
          ),
        )
      ],
    );
  }
}
