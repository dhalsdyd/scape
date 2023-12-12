import 'dart:async';
import 'dart:convert';
import 'dart:developer' as d;
import 'dart:math';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/util/secret_key.dart';
import 'package:scape/app/data/provider/api.dart';

class PrivacyPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TextEditingController chattingController = TextEditingController();
  StreamSubscription<String>? _streamSubscription;

  final openAI = OpenAI.instance.build(token: OPENAI_API_KEY);

  final api = ScapeApiProvider();

  RxBool isChatting = RxBool(false);

  Rx<List<List>> chatList = Rx<List<List>>([
    [
      "system",
      "You need to answer the questions about privacy statement and terms of service of certain sites or app or service that user has mantioned. You never answer any question againsts this rule. To answer the questions, you need to reference official web site for the first priority. "
    ]
  ]);

  Map parseEventDataString(String eventDataString) {
    // 여러개 있을 수 있다.
    final eventDataList = eventDataString.split("\n");

    //d.log("eventDataList: $eventDataList");

    bool isDone = false;
    String output = "";

    for (final eventData in eventDataList) {
      final List<String> eventDataSplit = eventData.split(":");

      //d.log("eventDataSplit: ${eventDataSplit}");
      if (eventDataSplit[0] == "data") {
        //d.log("True");

        String content = eventDataSplit[1];

        RegExp exp = RegExp(r'(?<=")[^"]*(?=")');
        exp.allMatches(content).forEach((match) {
          content = match.group(0)!;
        });

        // \u로 시작하는 모든 값을 찾아서 해당하는 값을 \u로 시작하는 16진수로 변환
        content = content.replaceAllMapped(
            RegExp(r'\\u[\da-fA-F]{4}'),
            (Match m) => String.fromCharCode(
                int.parse(m.group(0)!.substring(2, 6)!, radix: 16)));

        content = content.replaceAll("\\n", "\n");
        output += content;
      }

      if (eventDataSplit[0] == "event" && eventDataSplit[1] == "end") {
        isDone = true;
      }
    }

    return {"event": isDone ? "end" : "data", "data": output};
  }

  void addChat({String role = "human"}) async {
    if (isChatting.value) return;

    final content = chattingController.text;
    if (content.isEmpty) return;
    chattingController.clear();
    chatList.value.insert(0, [role, content]);

    Map data = {
      "input": {"question": content, "chat_history": chatList.value},
      "config": {}
    };
    String response = "";
    chatList.value.insert(0, ["system", "Loading..."]);
    isChatting.value = true;
    chatList.refresh();

    try {
      _streamSubscription = (await api.chatWithOpenAi(data)).listen((event) {
        //d.log(event);
        final eventDataMap = parseEventDataString(event);

        String output = eventDataMap["data"] as String;
        // d.log("Output: $output");
        response += output;
        chatList.value[0][1] = response;
        chatList.refresh();
        if (eventDataMap["event"] == "end") {
          _streamSubscription?.cancel();
        }
      });
    } catch (e) {
      chatList.value[0][1] = "Error occured. Please try again.";
      chatList.refresh();
    } finally {
      isChatting.value = false;
    }

    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
