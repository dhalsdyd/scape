import 'dart:math';

import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:scape/app/data/module/email/module.dart';
import 'package:scape/app/routes/route.dart';

class Virtual {
  String title;
  String subtitle;
  String color;

  String content;

  Virtual(this.title, this.subtitle, this.color, {this.content = ""});
}

class Constant {
  static const String upperWords = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String lowerWords = 'abcdefghijklmnopqrstuvwxyz';
  static const String numbers = '1234567890';
  static const String symbols = '@!%*?&';
  static List<Zone> zones = [
    Zone.catalonia,
    Zone.france,
    Zone.spain,
    Zone.uk,
    Zone.us,
    Zone.turkey,
    Zone.germany,
    Zone.canada,
    Zone.afghanistan,
    Zone.austria,
    Zone.belgium,
    Zone.brazil,
    Zone.china,
    Zone.egypt,
    Zone.finland,
    Zone.india,
    Zone.iran,
    Zone.israel,
    Zone.italy,
    Zone.japan,
    Zone.poland,
    Zone.romania,
    Zone.russia,
    Zone.saudiArabia,
    Zone.southAfrica,
    Zone.switzerland,
    Zone.uganda,
    Zone.ukraine,
    Zone.zimbabwe
  ];
}

class VirtualPageController extends GetxController {
  final EmailController emailController = Get.find<EmailController>();
  List<Virtual> virtual_list = [
    Virtual("Email", "Generate receive-only email", "gray"),
    Virtual("Password", "Generate random strong password", "orange"),
    Virtual("Basic Identify", "Generate name, gender, and address", "green"),
    //Virtual("Phone Number", "Coming soon", 0xffD3D3D3),
  ];

  bool loading = false;

  void onSelected(Virtual item) async {
    if (selected_list.value.contains(item)) {
      return;
    }

    switch (item.title) {
      case "Email":
        loading = true;
        item.content = await emailController.makeRandomEmail();
        loading = false;
        break;
      case "Password":
        item.content = makeRandomStrongPassword();
        break;
      case "Basic Identify":
        // Class Random 돌리기
        item.content = makeRandomName();
        break;
    }

    selected_list.value.add(item);

    selected_list.refresh();
  }

  void makeEmail() {
    onSelected(virtual_list[0]);
  }

  Rx<List<Virtual>> selected_list = Rx([]);
  void onDone(Virtual item) {
    selected_list.value.remove(item);
    selected_list.refresh();
  }

  String makeRandomStrongPassword() {
    Random rand = Random();

    int length = Random().nextInt(5) + 8;
    int count = Random().nextInt(3) + 1;

    const String all = Constant.upperWords +
        Constant.lowerWords +
        Constant.numbers +
        Constant.symbols;

    String password = '';

    for (int i = 0; i < count; i++) {
      String temp = '';
      for (int j = 0; j < length; j++) {
        temp += all[Random().nextInt(all.length)];
      }
      password += temp;
    }

    if (!password.contains(Constant.numbers)) {
      List<String> temp = password.split("").toList();
      int passwordRandomIndex = rand.nextInt(temp.length);
      int numberRandomIndex = rand.nextInt(Constant.numbers.length);
      temp[passwordRandomIndex] = Constant.numbers[numberRandomIndex];
      password = temp.join();
    }

    if (!password.contains(Constant.symbols)) {
      List<String> temp = password.split("").toList();
      int passwordRandomIndex = rand.nextInt(temp.length);
      int symbolRandomIndex = rand.nextInt(Constant.symbols.length);
      temp[passwordRandomIndex] = Constant.symbols[symbolRandomIndex];
      password = temp.join();
    }

    return password;
  }

  String makeRandomName() {
    Zone zone = Constant.zones[Random().nextInt(Constant.zones.length)];
    RandomNames randomNames = RandomNames(zone);
    return randomNames.fullName();
  }

  void saveIdentity() {
    if (loading) return;

    Map data = {};

    for (var element in selected_list.value) {
      data[element.title] = element.content;
    }

    selected_list.value = [];

    Get.toNamed(Routes.account_setting, arguments: data);
  }
}
