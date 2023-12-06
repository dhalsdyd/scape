import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scape/app/data/local/getx_storage.dart';
import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/module/account/module.dart';

class HomePageController extends GetxController with StateMixin {
  static HomePageController get to =>
      Get.find<HomePageController>(); // add this line

  final TextEditingController searchController = TextEditingController();
  Rx<String> search = Rx<String>("");

  final AccountController accountController = Get.find<AccountController>();
  final LocalDatabase localDatabase = Get.find<LocalDatabase>();

  List<Account> get accounts => accountController.accounts;
  List<String> get starList => localDatabase.starList;

  Rx<Account?> selectAccount = Rx(null);

  List<Map> logMockData = [
    {
      "date": "2023. 11. 10 18:27:11",
      "data": "Password copied by Me",
    },
    {
      "date": "2023. 11. 10 18:27:11",
      "data": "Update Password",
    },
    {
      "date": "2023. 11. 10 18:27:11",
      "data": "Shared with @",
    },
    {
      "date": "2023. 11. 10 18:27:11",
      "data": "Credential created bt Me",
    }
  ];

  void setting(Account account) {
    selectAccount.value = account;
  }

  void makeStar(String id) {
    localDatabase.toggleStar(id);
  }

  @override
  void onInit() {
    super.onInit();
    ever(search, (_) => accountController.getAccount());
  }
}
