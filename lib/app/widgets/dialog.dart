import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';

class ScapeDialogAction {
  final String title;
  final void Function()? onTap;
  final bool isHighlighted;
  ScapeDialogAction(
      {required this.title, this.onTap, this.isHighlighted = false});
}

class ScapeDialogActionButton extends StatelessWidget {
  const ScapeDialogActionButton(this.action, {Key? key}) : super(key: key);
  final ScapeDialogAction action;

  @override
  Widget build(BuildContext context) {
    return ScapeMediumTextButton(
      text: action.title,
      onTap: action.onTap,
      color: action.isHighlighted ? ScapeColors.mainColor : ScapeColors.black,
    );
  }
}

class ScapeDialog extends StatelessWidget {
  const ScapeDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  final String title;
  final String content;

  final List<ScapeDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: ScapeTextTheme.bold20),
            const SizedBox(height: 12),
            Text(content, style: ScapeTextTheme.regular12),
            const SizedBox(height: 12),
            for (var action in actions)
              Column(
                children: [
                  const SizedBox(height: 12),
                  ScapeDialogActionButton(action),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
