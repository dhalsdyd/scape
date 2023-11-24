import 'package:firebase_getx_boilerplate/app/pages/privacy/controller.dart';
import 'package:get/get.dart';

class PrivacyPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyPageController>(() => PrivacyPageController());
  }
}
