import 'package:flutter/services.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const colorMap = {
  'gray': [0xffD4DAE3, 0xff4D5259],
  "orange": [0xffEAC5A4, 0xff74583F],
  "green": [0xffD2E7D0, 0xff296A23]
};

class IdentitiyItem extends StatelessWidget {
  const IdentitiyItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.colors,
    this.onTap,
    this.isSearched = false,
  });

  final String title;
  final String subtitle;

  final List<int> colors;

  final Function()? onTap;
  final bool isSearched;

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

  int makeVeryBolder(int color) {
    int r = color >> 16 & 0xFF;
    int g = color >> 8 & 0xFF;
    int b = color & 0xFF;

    r = (r * 0.6).round();
    g = (g * 0.6).round();
    b = (b * 0.6).round();

    return (0xFF << 24) | (r << 16) | (g << 8) | b;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color:
                      !isSearched ? ScapeColors.Gray60 : ScapeColors.Primary30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                children: [
                  Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(colors[0]),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: SvgPicture.asset("assets/icons/key_filled.svg",
                              color: Color(makeBolder(colors[1]))))),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: ScapeTextTheme.Text3_MEDIUM),
                      const SizedBox(height: 0),
                      Text(subtitle,
                          style: ScapeTextTheme.Text1.copyWith(
                              color: ScapeColors.Gray20)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class IdentityDetailItem extends StatefulWidget {
  const IdentityDetailItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.content,
      required this.colors,
      this.onTap,
      this.isSearched = false});

  final String title;
  final String subtitle;
  final String content;
  final List<int> colors;

  final Function()? onTap;
  final bool isSearched;

  @override
  State<IdentityDetailItem> createState() => _IdentityDetailItemState();
}

class _IdentityDetailItemState extends State<IdentityDetailItem> {
  bool isOpen = false;
  bool isCopy = false;

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

  int makeVeryBolder(int color) {
    int r = color >> 16 & 0xFF;
    int g = color >> 8 & 0xFF;
    int b = color & 0xFF;

    r = (r * 0.6).round();
    g = (g * 0.6).round();
    b = (b * 0.6).round();

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
                                color: Color(widget.colors[0]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/icons/key_filled.svg",
                                      color: Color(
                                          makeVeryBolder(widget.colors[1]))))),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title,
                                  style: ScapeTextTheme.Text3_MEDIUM),
                              Text(widget.subtitle,
                                  style: ScapeTextTheme.Text1.copyWith(
                                      color: ScapeColors.Gray20)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: SvgPicture.asset("assets/icons/trash.svg"))
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: ScapeColors.Gray60, height: 1),
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
    if (false) {
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
                    Text(widget.content, style: ScapeTextTheme.Text3_BOLD)
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
    }
    return Row(
      children: [
        Expanded(
          child: Center(
              child: Text(widget.content, style: ScapeTextTheme.Text3_BOLD)),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.content));
            // POPUP
            setState(() {
              isCopy = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffE6E6E6)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
              child: Text(
                isCopy ? "Copied" : "Copy",
                style: ScapeTextTheme.Text1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
