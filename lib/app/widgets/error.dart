import 'package:flutter/material.dart';
import 'package:scape/app/core/theme/text_theme.dart';

class ErrorMessageCard extends StatelessWidget {
  const ErrorMessageCard({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50.0,
            ),
            const SizedBox(height: 10.0),
            const Text(
              '에러 발생',
              style: ScapeTextTheme.Text5_BOLD,
            ),
            const SizedBox(height: 10.0),
            Text(errorMessage,
                textAlign: TextAlign.center, style: ScapeTextTheme.Text1),
          ],
        ),
      ),
    );
  }
}
