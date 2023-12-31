import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ScapeTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final bool? enableInteractiveSelection;
  final Widget? prefixIcon;

  final bool isShadow;

  const ScapeTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.onEditingComplete,
    this.enableInteractiveSelection,
    this.autofocus = false,
    this.isPassword = false,
    this.prefixIcon,
    this.isShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        if (isShadow)
          BoxShadow(
              color: const Color(0xffC6C6C6).withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 4))
      ]),
      child: TextField(
        onSubmitted: onSubmitted,
        enableInteractiveSelection: enableInteractiveSelection,
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        autofocus: autofocus,
        style: ScapeTextTheme.Text2,
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
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                width: 1, style: BorderStyle.solid, color: ScapeColors.Gray40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                width: 1, style: BorderStyle.solid, color: ScapeColors.Gray40),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: ScapeColors.Primary40),
          ),
          counterText: "",
          fillColor: ScapeColors.white,
          filled: true,
          hintStyle:
              ScapeTextTheme.Text2.copyWith(color: const Color(0xff777777)),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: prefixIcon,
          ),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 48, maxWidth: 48),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          floatingLabelStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
      ),
    );
  }
}

class ScapeTextFormField extends StatelessWidget {
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

  const ScapeTextFormField({
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
      style: ScapeTextTheme.regular20,
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
        fillColor: ScapeColors.black,
        filled: true,
        hintStyle: ScapeTextTheme.regular20,
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
class ScapeDropdownField extends StatelessWidget {
  ScapeDropdownField({super.key});

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

class ScapeDropdownIcon extends StatelessWidget {
  ScapeDropdownIcon({super.key, required this.icon, this.onTap});

  final Widget icon;
  final Function(String)? onTap;

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
                //_overlayPortalController.hide();
              },
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                offset: const Offset(-50, 0),
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE6E6E6)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _makeListItem("Name", isTop: true),
                            const Divider(),
                            _makeListItem("Date"),
                          ],
                        ))),
              ),
            );
          },
          child: GestureDetector(
              onTap: () {
                _overlayPortalController.show();
              },
              child: icon)),
    );
  }

  GestureDetector _makeListItem(String name, {bool isTop = false}) {
    return GestureDetector(
      onTap: () {
        onTap?.call(name);
        _overlayPortalController.hide();
      },
      child: Column(
        children: [
          SizedBox(height: isTop ? 8 : 4),
          Text(name, style: ScapeTextTheme.Text2_MEDIUM),
          SizedBox(height: isTop ? 4 : 8),
        ],
      ),
    );
  }
}
