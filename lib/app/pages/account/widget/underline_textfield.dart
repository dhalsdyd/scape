import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';

class UnderLineTextField extends StatefulWidget {
  const UnderLineTextField({
    super.key,
    required this.emoji,
    required this.controller,
    required this.hintText,
    this.editable = true,
    this.isPassword = false,
    this.center = false,
  });

  final String emoji;
  final String hintText;
  final bool editable;
  final bool isPassword;
  final bool center;
  final TextEditingController controller;

  @override
  State<UnderLineTextField> createState() => _UnderLineTextFieldState();
}

class _UnderLineTextFieldState extends State<UnderLineTextField> {
  bool _passwordVisible = false;
  bool _editabled = false;

  @override
  void initState() {
    if (!widget.editable) {
      _editabled = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            TextField(
              enabled: _editabled,
              controller: widget.controller,
              cursorColor: ScapeColors.Primary40,
              obscureText: _passwordVisible,
              style: ScapeTextTheme.Text3,
              textAlign: widget.center ? TextAlign.center : TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                focusColor: ScapeColors.Primary40,
                fillColor: ScapeColors.Primary40,
                hoverColor: ScapeColors.Primary40,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: widget.hintText,
                hintStyle: ScapeTextTheme.Text3.copyWith(color: Colors.grey),
                prefixIcon: widget.emoji != ""
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          widget.emoji,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : null,
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ScapeColors.Primary40, width: 2.0)),
              ),
            ),
            if (widget.editable)
              Positioned(
                right: 0,
                bottom: 10,
                child: Row(
                  children: [
                    !widget.isPassword
                        ? const SizedBox()
                        : Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                child: Container(
                                  color: ScapeColors.Gray60,
                                  child: SvgPicture.asset(
                                    _passwordVisible
                                        ? "assets/icons/show.svg"
                                        : "assets/icons/hide.svg",
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _editabled = !_editabled;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xffE6E6E6)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7.5, horizontal: 8),
                          child: Text(
                            !_editabled ? "Edit" : "Done",
                            style: ScapeTextTheme.Text1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
