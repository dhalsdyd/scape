import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/provider/api_interface.dart';

class AccountRepository {
  final ScapeApiInterface api;

  AccountRepository({required this.api});

  Future<List<Account>> getAccount() async => api.getAccount();
  Future<void> createAccount(Map data) async => api.createAccount(data);
}
