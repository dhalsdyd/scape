import 'dart:developer';

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
  Rx<List<int>> searchResult = Rx<List<int>>([]);

  bool isSearched(int index) {
    for (var i = 0; i < searchResult.value.length; i++) {
      if (searchResult.value[i] == index) {
        return true;
      }
    }
    return false;
  }

  final AccountController accountController = Get.find<AccountController>();
  final LocalDatabase localDatabase = Get.find<LocalDatabase>();

  List<Account> get accounts => accountController.accounts;
  set accounts(List<Account> value) {
    accountController.accountList.value = value;
    accountController.accountList.refresh();
  }

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
    searchController.addListener(() {
      search.value = searchController.text;
    });
    debounce(search, (callback) {
      List<Account> temp2 = [];
      for (var i = 0; i < accounts.length; i++) {
        if (accounts[i]
            .name
            .toLowerCase()
            .contains(search.value.toLowerCase())) {
          temp2.add(accounts[i]);
        }
      }

      for (var i = 0; i < accounts.length; i++) {
        if (!temp2.contains(accounts[i])) {
          temp2.add(accounts[i]);
        }
      }
      accounts = temp2;
      // 순서도 위에 올려주고, 인덱스 위치도 저장해줘
      List<int> temp = [];
      for (var i = 0; i < accounts.length; i++) {
        if (accounts[i]
            .name
            .toLowerCase()
            .contains(search.value.toLowerCase())) {
          temp.add(i);
        }
      }

      if (search.value == "") {
        temp = [];
      }

      searchResult.value = temp;
      log("searchResult : ${searchResult.value}");
      searchResult.refresh();
    }, time: const Duration(milliseconds: 500));
  }

  void deleteAccount() async {
    await accountController.deleteAccount(selectAccount.value!.id);
    Get.back();
  }

  Future<void> refreshAccount() async {
    await accountController.getAccount();
    accounts = accountController.accounts;
  }
}
