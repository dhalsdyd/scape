import 'package:get/get.dart';
import 'package:scape/app/pages/login/controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
