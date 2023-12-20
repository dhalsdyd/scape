import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/models/email.dart';

abstract class ScapeApiInterface {
  //Auth
  Future<Map> loginWithGoogle();
  Future<Map> refreshAccessToken(String refreshToken);

  //Account
  Future<List<Account>> getAccount();
  Future<void> createAccount(Map data);
  Future<void> deleteAccount(String id);
  Future<void> updateAccount(String id, Map data);

  //Email.
  Future<List<Email>> getEmail();
  Future<Email> createEmail();
  Future<List<EmailMessage>> getEmailMessage();

  //Chat
  Future<Stream<String>> chatWithOpenAi(Map data);
}
