import 'package:cached_network_image/cached_network_image.dart';
import 'package:favicon/favicon.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/pages/home/controller.dart';
import 'package:scape/app/pages/home/widget/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AccountItem extends StatefulWidget {
  const AccountItem(
      {super.key,
      required this.account_,
      required this.name,
      required this.account,
      this.password,
      this.isSearched = false});

  final Account account_;
  final String name;
  final String account;
  final String? password;

  final bool isSearched;

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
  bool isOpen = false;
  bool isCopy = false;

  Color makeBrighter(Color color) {
    return Color.fromARGB(color.alpha, color.red, color.green, color.blue);
  }

  Future<Map> getFaviconAndColor() async {
    final favicon = await FaviconFinder.getBest("https://${widget.name}");
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(favicon!.url));

    return {
      "favicon": favicon.url,
      "color": makeBrighter(paletteGenerator.dominantColor!.color)
    };
  }

  Widget profileImage() {
    return FutureBuilder<Map>(
        future: getFaviconAndColor(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: snapshot.data!["color"]),
                  //color: ,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: snapshot.data!["favicon"],
                  width: 18,
                  errorWidget: (context, error, stackTrace) =>
                      SvgPicture.network(
                    snapshot.data!["favicon"],
                    width: 18,
                  ),
                )));
          } else {
            return Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(widget.name[0],
                    style: ScapeTextTheme.Text4_BOLD.copyWith(
                        color: Colors.white, fontSize: 16)),
              ),
            );
          }
        }));

    // if (widget.image != null) {
    //   return Container(
    //       width: 36,
    //       height: 36,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       child: Center(child: Image.network(widget.image!)));
    // } else {
    //   return Container(
    //     width: 36,
    //     height: 36,
    //     decoration: BoxDecoration(
    //       color: Colors.grey,
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     child: Center(
    //       child: Text(widget.name[0],
    //           style: ScapeTextTheme.Text4_BOLD.copyWith(color: Colors.white)),
    //     ),
    //   );
    // }
  }

  Widget iconWithText(String assetName, String label) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/$assetName.svg"),
        const SizedBox(width: 2),
        Text(label,
            style:
                ScapeTextTheme.Text1.copyWith(color: const Color(0xff8f8f8f))),
      ],
    );
  }

  Widget iconWithText2(String assetName, String label) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/$assetName.svg", width: 16),
        const SizedBox(width: 4),
        Text(label, style: ScapeTextTheme.Text2_MEDIUM),
      ],
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Widget optionTool(String name) {
    return GestureDetector(
      onTap: () {
        switch (name) {
          case "edit":
            Get.find<HomePageController>().setting(widget.account_);
            Get.to(() => const AccountDetailPage());
            break;
          case "star":
            break;
          case "share":
            Share.share("https://scape.page.link/1234567890");
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xffD3D3D3)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/$name.svg"),
              const SizedBox(width: 8),
              Text(capitalize(name), style: ScapeTextTheme.Text1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderOptionIsNotOpen() {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: widget.account));
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
            !isCopy ? "Copy" : "Copied",
            style: ScapeTextTheme.Text1,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIsNotOpen() {
    String password = "*" * widget.password!.length;

    return Row(
      children: [
        Row(
          children: [
            profileImage(),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: ScapeTextTheme.Text3_MEDIUM),
                const SizedBox(height: 4),
                iconWithText("small_mail", widget.account),
                const SizedBox(height: 2),
                if (widget.password != null) iconWithText("key", password),
              ],
            )
          ],
        ),
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
        icon: const Icon(Icons.keyboard_arrow_up));
  }

  Widget _buildHeaderIsOpen() {
    return Row(
      children: [
        Row(
          children: [
            profileImage(),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: ScapeTextTheme.Text3_MEDIUM),
                const SizedBox(height: 4),
                Text(
                  "Created At ${widget.account_.createdAt.toString().split(" ")[0]}",
                  style: ScapeTextTheme.Text1.copyWith(
                      color: const Color(0xff868686)),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildContentIsOpen() {
    return Column(
      children: [
        const SizedBox(height: 16),
        iconWithText2("small_mail", "Email : ${widget.account}"),
        const SizedBox(height: 12),
        if (widget.password != null)
          iconWithText2("key", "Password : ${widget.password!}"),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: optionTool("star")),
            const SizedBox(width: 16),
            Expanded(child: optionTool("edit")),
            const SizedBox(width: 16),
            Expanded(child: optionTool("share")),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isOpen) return;
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: !widget.isSearched
                  ? ScapeColors.Gray60
                  : ScapeColors.Primary20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            children: [
              AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: isOpen
                            ? _buildHeaderIsOpen()
                            : _buildHeaderIsNotOpen(),
                      )),
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isOpen
                              ? _buildHeaderOptionIsOpen()
                              : _buildHeaderOptionIsNotOpen()),
                    ],
                  )),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: isOpen ? _buildContentIsOpen() : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
