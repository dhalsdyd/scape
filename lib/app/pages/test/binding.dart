import 'package:get/get.dart';
import 'package:scape/app/pages/test/controller.dart';

class TestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestPageController>(
      () => TestPageController(),
    );
  }
}
