import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FGBPTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final bool? enableInteractiveSelection;
  final Widget? prefixIcon;

  const FGBPTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.onChanged,
    this.textInputAction,
    this.onEditingComplete,
    this.enableInteractiveSelection,
    this.autofocus = false,
    this.isPassword = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: enableInteractiveSelection,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      autofocus: autofocus,
      style: FGBPTextTheme.Text2,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              width: 1, style: BorderStyle.solid, color: FGBPColors.Gray60),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              width: 1, style: BorderStyle.solid, color: FGBPColors.Gray60),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              width: 1, style: BorderStyle.solid, color: FGBPColors.Primary40),
        ),
        counterText: "",
        fillColor: FGBPColors.white,
        filled: true,
        hintStyle: FGBPTextTheme.Text2.copyWith(color: const Color(0xff777777)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: prefixIcon,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        floatingLabelStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
    );
  }
}

class FGBPTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final bool? enableInteractiveSelection;

  const FGBPTextFormField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.onEditingComplete,
    this.enableInteractiveSelection,
    this.autofocus = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      textInputAction: textInputAction,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      autofocus: autofocus,
      style: FGBPTextTheme.regular20,
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        counterText: "",
        fillColor: FGBPColors.black,
        filled: true,
        hintStyle: FGBPTextTheme.regular20,
        floatingLabelStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
      validator: validator,
    );
  }
}

// Custom Dropdown Button with OverlayEntry
class FGBPDropdownField extends StatelessWidget {
  FGBPDropdownField({super.key});

  final OverlayPortalController _overlayPortalController =
      OverlayPortalController();
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
          controller: _overlayPortalController,
          overlayChildBuilder: (context) {
            return GestureDetector(
              onTap: () {
                _overlayPortalController.hide();
              },
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
          child: GestureDetector(
            onTap: () {
              _overlayPortalController.show();
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          )),
    );
  }
}
