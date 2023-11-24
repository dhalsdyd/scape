import 'package:firebase_getx_boilerplate/app/pages/account/controller.dart';
import 'package:get/get.dart';

class AccountDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailController>(() => AccountDetailController());
  }
}