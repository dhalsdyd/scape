import 'package:scape/app/pages/account/controller.dart';
import 'package:get/get.dart';

class AccountSettingPageBindng extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingPageController>(
      () => AccountSettingPageController(),
    );
  }
}
