import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scape/app/core/util/secret_key.dart';

class PrivacyPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TextEditingController chattingController = TextEditingController();
  final openAI = OpenAI.instance.build(token: OPENAI_API_KEY);

  Stream<String> createTextStream(String inputText) async* {
    List<String> words = inputText.split(' ');

    for (String word in words) {
      // 1초마다 단어를 방출
      await Future.delayed(const Duration(milliseconds: 100));
      yield word;
    }
  }

  Rx<Map> mockPingPong = Rx<Map>({
    "구글 개인정보처리방침에 대해 알려줘":
        """
네, 물론입니다. 구글의 개인정보처리방침은 사용자의 정보 수집, 보호, 그리고 사용에 관한 중요한 정보를 다룹니다. 아래는 구글 개인정보처리방침의 주요 내용을 간략히 정리한 것입니다:

수집하는 정보 유형:

계정 정보: 이메일 주소, 전화번호, 기타 필수 정보
디바이스 정보: 사용 중인 기기와 브라우저 정보, IP 주소 등
서비스 이용 정보: 검색 기록, 시청 기록, 위치 정보 등
쿠키와 유사 기술을 통한 정보 수집
정보 사용 목적:

개인화된 서비스 제공
광고 및 콘텐츠 제공
보안 및 기술적 문제 해결
서비스 개선과 신규 서비스 개발
정보의 보호와 보안:

안전한 저장 및 전송을 위한 기술적, 물리적 보호 조치
암호화 기술의 사용
사용자의 데이터 접근 권한 제한
정보 공유:

사용자 동의 없이는 개인 식별이 불가능한 형태로만 정보를 공유
법적 요구사항이나 합병, 인수 등의 상황에서만 정보 공유
사용자 권리:

정보 열람, 수정, 삭제 및 이동 권리
개인정보 처리에 대한 동의 철회 가능
구글 개인정보처리방침 전문은 여기에서 확인할 수 있습니다. 출처: 구글 개인정보처리방침 (https://policies.google.com/privacy?hl=ko)
"""
  });

  Rx<List<Map>> chatList = Rx<List<Map>>([
    {
      "role": "system",
      "content":
          "어떤 서비스나 사이트의 개인정보처리방침에 관한 정보를 알려드리겠습니다. 제공하려는 서비스나 사이트의 이름을 알려주시면 해당 개인정보처리방침을 요약하여 알려드리겠습니다."
    }
  ]);

  void addChat({String role = "me"}) {
    final content = chattingController.text;
    if (content.isEmpty) return;

    chattingController.clear();

    chatList.value.insert(0, {"role": role, "content": content});

    String response = mockPingPong.value[content] ??
        "죄송합니다만, 개인정보처리방침에 관한 질문이 아닙니다. 개인정보처리방침에 관련된 내용으로 다시 질문해 주시기 바랍니다.";

    Stream<String> textStream = createTextStream(response);

    String resposne = "";
    chatList.value.insert(0, {"role": "system", "content": ""});
    textStream.listen((event) {
      resposne += event;
      chatList.value.first["content"] = resposne;
      chatList.refresh();
    }).onDone(() {
      // URL
    });

    //chatList.refresh();
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
