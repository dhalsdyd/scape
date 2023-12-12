import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';

class CustomChatBubble extends CustomPainter {
  CustomChatBubble({required this.color, required this.isOwn});

  final Color color;
  final bool isOwn;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    Path paintBubbleTail() {
      Path path;
      if (!isOwn) {
        path = Path()
          ..moveTo(5, size.height - 5)
          ..quadraticBezierTo(-5, size.height, -16, size.height - 4)
          ..quadraticBezierTo(-5, size.height - 5, 0, size.height - 17);
        return path;
      } else {
        path = Path()
          ..moveTo(size.width - 6, size.height - 4)
          ..quadraticBezierTo(
              size.width + 5, size.height, size.width + 16, size.height - 4)
          ..quadraticBezierTo(
              size.width + 5, size.height - 5, size.width, size.height - 17);
        return path;
      }
    }

    final RRect bubbleBody = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(16));
    final Path bubbleTail = paintBubbleTail();

    canvas.drawRRect(bubbleBody, paint);
    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.isMe, required this.text});

  final bool isMe;
  final String text;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = Get.width > 475 ? 475 : Get.width;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMe)
          Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ScapeColors.Gray40,
              ),
              child: Image.network(
                  "https://chatgptaihub.com/wp-content/uploads/2023/06/ChatGpt-Logo-with-Black-Background.png")),
        const SizedBox(width: 10),
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: deviceWidth * 0.7),
            child: CustomPaint(
              painter: CustomChatBubble(
                  color: isMe ? ScapeColors.Primary30 : ScapeColors.Gray40,
                  isOwn: isMe),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: isMe ? ScapeColors.Primary30 : ScapeColors.Gray40,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  text,
                  textAlign: isMe ? TextAlign.right : TextAlign.left,
                  style: ScapeTextTheme.Text3.copyWith(
                      color: isMe ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
