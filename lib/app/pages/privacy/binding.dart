import 'package:scape/app/pages/privacy/controller.dart';
import 'package:get/get.dart';

class PrivacyPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyPageController>(() => PrivacyPageController());
  }
}
