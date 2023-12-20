import 'package:get/get.dart';
import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/module/account/repository.dart';

class AccountController extends GetxController {
  final AccountRepository repository;

  AccountController({required this.repository});

  Rx<List<Account>> accountList = Rx<List<Account>>([]);
  List<Account> get accounts => accountList.value;

  Future<void> getAccount() async {
    final result = await repository.getAccount();
    accountList.value = result;
  }

  Future<void> createAccount(Map data) async {
    try {
      await repository.createAccount(data);
      await getAccount();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAccount(String id) async {
    try {
      await repository.deleteAccount(id);
      await getAccount();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAccount(String id, Map data) async {
    try {
      await repository.updateAccount(id, data);
      await getAccount();
    } catch (e) {
      rethrow;
    }
  }
}
