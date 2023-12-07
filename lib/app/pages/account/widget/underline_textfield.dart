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
        Row(
          children: [
            Expanded(
              child: TextField(
                enabled: _editabled,
                controller: widget.controller,
                cursorColor: ScapeColors.Primary40,
                obscureText: _passwordVisible,
                style: ScapeTextTheme.Text3,
                textAlign: widget.center ? TextAlign.center : TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isDense: true,
                  focusColor: ScapeColors.Primary40,
                  fillColor: ScapeColors.Primary40,
                  hoverColor: ScapeColors.Primary40,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: widget.hintText,
                  hintStyle: ScapeTextTheme.Text3_MEDIUM.copyWith(
                      color: ScapeColors.Gray30),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 48, maxWidth: 48),
                  prefixIcon: widget.emoji != ""
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset(
                            widget.emoji,
                            width: 16,
                            height: 16,
                            color: Colors.black,
                          ),
                        )
                      : null,
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ScapeColors.Gray60)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ScapeColors.Gray60)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ScapeColors.Primary40, width: 2.0)),
                ),
              ),
            ),
            if (widget.editable)
              Row(
                children: [
                  const SizedBox(width: 8),
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
                              child: SvgPicture.asset(
                                _passwordVisible
                                    ? "assets/icons/show.svg"
                                    : "assets/icons/hide.svg",
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
              )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class UnderLineTextField2 extends StatefulWidget {
  const UnderLineTextField2({
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
  State<UnderLineTextField2> createState() => _UnderLineTextField2State();
}

class _UnderLineTextField2State extends State<UnderLineTextField2> {
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
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: ScapeColors.Gray60)),
          child: TextField(
            enabled: _editabled,
            controller: widget.controller,
            cursorColor: ScapeColors.Primary40,
            obscureText: _passwordVisible,
            style: ScapeTextTheme.Text3,
            //textAlign: widget.center ? TextAlign.center : TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: widget.hintText,
            ),
          ),
        )),
      ],
    );
  }
}
