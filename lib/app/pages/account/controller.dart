import 'dart:async';
import 'dart:developer';

import 'package:favicon/favicon.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:scape/app/data/module/account/module.dart';
import 'package:scape/app/pages/account/widget/custom_field.dart';
import 'package:scape/app/widgets/snackbar.dart';

const availableList = [
  "Gender",
  "Birthday",
  "Phone Number",
  "Address",
];

class AccountSettingPageController extends GetxController with StateMixin {
  Completer? _createCompleter;

  final AccountController accountController = Get.find<AccountController>();

  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final RxString serviceName = "".obs;
  final RxString email = "".obs;
  final RxString id = "".obs;
  final RxString password = "".obs;
  final RxString name = "".obs;

  final Rx<List<Map>> moreInfo = Rx([]);

  final RxBool isPasswordVisible = false.obs;

  final RxString realServiceName = "".obs;
  final RxString faviconUrl = "".obs;
  final Rx<Color?> faviconColor = Rx(null);

  final param = Get.arguments;

  String extractServiceName(String url) {
    // 정규 표현식을 사용하여 서비스 이름을 추출
    RegExp regExp = RegExp(r'^https?://(?:www\.)?(.+?)(?:\.\w+)+');
    Match match = regExp.firstMatch(url) as Match;

    if (match.groupCount > 0) {
      // 첫 번째 그룹은 서비스 이름입니다.
      return match.group(1)!;
    } else {
      // 일치하는 패턴이 없으면 빈 문자열 반환
      return '';
    }
  }

  // FIGMA NOT WORKGING
  Future<void> getIconUrl(String url) async {
    try {
      final favicon = await FaviconFinder.getBest(url);

      if (favicon == null) {
        faviconUrl.value = "";
        return;
      }

      log("FIND IT! : ${favicon.url}");
      faviconUrl.value = favicon.url;
      //ealServiceName.value = extractServiceName(favicon.url).toUpperCase();
      //faviconColor.value = await getImagePalette(NetworkImage(favicon.url));
    } catch (e) {
      faviconUrl.value = "";
      realServiceName.value = "";
    }
  }

  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
  }

  @override
  void onInit() {
    serviceNameController.addListener(() {
      serviceName.value = serviceNameController.text;
    });
    emailController.addListener(() {
      email.value = emailController.text;
    });
    idController.addListener(() {
      id.value = idController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
    nameController.addListener(() {
      name.value = nameController.text;
    });

    debounce(serviceName, (callback) {
      log("FINDing");
      getIconUrl("https://$serviceName");
    }, time: const Duration(milliseconds: 500));

    change(null, status: RxStatus.success());

    log("param : $param");
    if (param != null) {
      settingAccount(param);
    }

    super.onInit();
  }

  void settingAccount(Map accountData) {
    String serviceName = accountData["serviceName"] ?? "";
    String email = accountData["Email"] ?? "";
    String password = accountData["Password"] ?? "";
    String name = accountData["Name"] ?? "";

    serviceNameController.text = serviceName;
    emailController.text = email;
    passwordController.text = password;
    nameController.text = name;

    for (String availalbe in availableList) {
      if (accountData.containsKey(availalbe)) {
        moreInfo.value.add({
          "name": availalbe,
          "value": accountData[availalbe],
          "hidePreview": false,
          "description": "This is your $availalbe.",
          "emoji": "👤"
        });
      }
    }
  }

  bool get inputValidity {
    return email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        name.value.isNotEmpty &&
        serviceName.value.isNotEmpty;
  }

  void createAccount() async {
    if (_createCompleter != null && !_createCompleter!.isCompleted) {
      return;
    }

    _createCompleter = Completer();

    String name = serviceNameController.text;
    List<Map> fields = [
      {
        "name": "Email/ID",
        "value": emailController.text,
        "hidePreview": false,
        "description": "This is your email or id.",
        "emoji": "📧"
      },
      {
        "name": "Password",
        "value": passwordController.text,
        "hidePreview": true,
        "description": "This is your password.",
        "emoji": "🔒"
      },
      {
        "name": "Name",
        "value": nameController.text,
        "hidePreview": false,
        "description": "This is your name.",
        "emoji": "👤"
      },
    ];

    for (var item in moreInfo.value) {
      fields.add(item);
    }

    change(null, status: RxStatus.loading());
    try {
      await accountController.createAccount({
        "name": name,
        "fields": fields,
      });
      change(null, status: RxStatus.success());
      Get.back();
    } catch (e) {
      change(null, status: RxStatus.error());
      ScapeErrorSnackBar().open("생성하는데 실패했습니다.");
    } finally {
      _createCompleter!.complete();
    }
  }

  void addAccountInformation() async {
    final result = await Get.dialog(
      CustomFieldModal(),
      barrierDismissible: true,
      useSafeArea: true,
      transitionDuration: const Duration(milliseconds: 1),
    );

    if (result != null) {
      moreInfo.value.add(result);
    }
    moreInfo.refresh();
  }

  void modifyAccountInformation(Map item) async {
    final result = await Get.dialog(
      CustomFieldModal(),
      arguments: item,
      barrierDismissible: true,
      useSafeArea: true,
      transitionDuration: const Duration(milliseconds: 1),
    );

    if (result != null) {
      // index 찾기
      int index = 0;
      for (int i = 0; i < moreInfo.value.length; i++) {
        if (moreInfo.value[i]["name"] == item["name"]) {
          index = i;
          break;
        }
      }

      moreInfo.value.remove(item);
      moreInfo.value.insert(index, result);
    }
    moreInfo.refresh();
  }
}
