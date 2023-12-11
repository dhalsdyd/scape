import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scape/app/data/models/email.dart';
import 'package:shimmer/shimmer.dart';

class InboxDetailPage extends StatelessWidget {
  const InboxDetailPage({super.key, required this.emailMessage});

  final EmailMessage emailMessage;

  Widget _shimmerText(String text, {TextStyle style = ScapeTextTheme.Text1}) {
    return Text(text, style: style);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                    child: _shimmerText(emailMessage.subject,
                        style: ScapeTextTheme.Text4_BOLD)),
                SvgPicture.asset("assets/icons/more_vertical.svg")
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ScapeColors.Gray40,
                  ),
                  child: Center(
                      child: Text(emailMessage.from[0],
                          style: ScapeTextTheme.Text3_MEDIUM.copyWith(
                              color: ScapeColors.Gray10))),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              emailMessage.from.split(" ")[0],
                              style: ScapeTextTheme.Text3_MEDIUM,
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            _shimmerText(
                                emailMessage.createdAt.toString().split(".")[0],
                                style: ScapeTextTheme.Text2),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _shimmerText(
                            "FROM : ${emailMessage.from.split(" ")[1].substring(1, emailMessage.from.split(" ")[1].length - 1)}",
                            style: ScapeTextTheme.Text2.copyWith(
                                color: ScapeColors.Gray20)),
                        _shimmerText("To : ${emailMessage.to}",
                            style: ScapeTextTheme.Text2.copyWith(
                                color: ScapeColors.Gray20)),
                      ]),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              color: ScapeColors.Gray60,
            ),
            const SizedBox(height: 16),
            Expanded(child: HtmlWidget(emailMessage.html))
          ]),
        ));
  }
}
