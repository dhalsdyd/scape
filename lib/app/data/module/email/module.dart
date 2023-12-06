import 'dart:developer';

import 'package:get/get.dart';
import 'package:scape/app/data/models/email.dart';
import 'package:scape/app/data/module/email/repository.dart';

class EmailController extends GetxController with StateMixin {
  final EmailRepository repository;

  EmailController({required this.repository});

  Rx<List<Email>> email_list = Rx<List<Email>>([]);
  List<Email> get emails => email_list.value;

  Rx<List<EmailMessage>> emailMessage_list = Rx<List<EmailMessage>>([]);
  List<EmailMessage> get emailMessages => emailMessage_list.value;

  Rx<bool> creatingMail = Rx<bool>(false);

  Future<void> getEmailMessages() async {
    change(null, status: RxStatus.loading());
    try {
      emailMessage_list.value = await repository.getEmailMessage();
      change(emailMessage_list.value, status: RxStatus.success());
    } catch (e) {
      rethrow;
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  Future<String> makeRandomEmail() async {
    creatingMail.value = true;

    try {
      Email result = await repository.createEmail();
      creatingMail.value = false;
      return result.email;
    } catch (e) {
      rethrow;
    } finally {
      creatingMail.value = false;
    }
  }

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
