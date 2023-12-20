import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/provider/api_interface.dart';

class AccountRepository {
  final ScapeApiInterface api;

  AccountRepository({required this.api});

  Future<List<Account>> getAccount() async => api.getAccount();
  Future<void> createAccount(Map data) async => api.createAccount(data);
  Future<void> deleteAccount(String id) async => api.deleteAccount(id);
  Future<void> updateAccount(String id, Map data) async =>
      api.updateAccount(id, data);
}
