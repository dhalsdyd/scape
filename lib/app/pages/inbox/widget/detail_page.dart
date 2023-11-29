import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class InboxDetailPage extends StatelessWidget {
  const InboxDetailPage({super.key});

  Widget _shimmerText(String text, {TextStyle style = ScapeTextTheme.Text1}) {
    return Shimmer.fromColors(
        baseColor: ScapeColors.Gray20,
        highlightColor: ScapeColors.Gray40,
        child: Text(text, style: style));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                    child: _shimmerText("광고성 메일",
                        style: ScapeTextTheme.Text4_BOLD)),
                SvgPicture.asset("assets/icons/more_vertical.svg")
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Shimmer.fromColors(
                    baseColor: ScapeColors.Gray20,
                    highlightColor: ScapeColors.Gray40,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text("A", style: ScapeTextTheme.Text4_BOLD),
                      ),
                    )),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _shimmerText(
                              "보낸 사람",
                              style: ScapeTextTheme.Text3_MEDIUM,
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            _shimmerText("2021.08.01 12:00",
                                style: ScapeTextTheme.Text2),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _shimmerText("FROM", style: ScapeTextTheme.Text2),
                        _shimmerText("To", style: ScapeTextTheme.Text2),
                      ]),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _shimmerText("광고성 메일을 차단하여 더욱 깨끗한 메일함을 유지하세요.",
                style: ScapeTextTheme.Text1),
          ]),
        ));
  }
}
