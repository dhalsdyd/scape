import 'package:scape/app/data/models/email.dart';
import 'package:scape/app/data/provider/api_interface.dart';

class EmailRepository {
  final ScapeApiInterface api;

  EmailRepository({required this.api});

  Future<List<Email>> getEmail() async => await api.getEmail();
  Future<Email> createEmail() async => await api.createEmail();
  Future<List<EmailMessage>> getEmailMessage() async =>
      await api.getEmailMessage();
}
