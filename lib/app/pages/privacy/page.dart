import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/core/theme/text_theme.dart';
import 'package:scape/app/pages/privacy/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scape/app/pages/privacy/widget/chat_item.dart';
import 'package:scape/app/widgets/bottom_modal.dart';
import 'package:scape/app/widgets/textfield.dart';

class PrivacyPage extends GetView<PrivacyPageController> {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const AppbarItem(title: "Search Privacy Policy"),
              const SizedBox(height: 16),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Obx(
                    () => ListView.separated(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          if (controller.chatList.value[index][0] == "system") {
                            return const SizedBox();
                          }

                          return ChatItem(
                            isMe: controller.chatList.value[index][0] != "ai",
                            text: controller.chatList.value[index][1],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 8);
                        },
                        itemCount: controller.chatList.value.length),
                  ),
                ),
              )),
              const SizedBox(height: 8),
              ScapeTextField(
                controller: controller.chattingController,
                hintText: "Ask Anything :)",
                prefixIcon: const Icon(Icons.send),
                onEditingComplete: controller.addChat,
                isShadow: true,
              ),
            ]),
          ),
        ));
  }
}
