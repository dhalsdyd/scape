import 'package:get/get.dart';
import 'package:scape/app/pages/temp/controller.dart';

class TempPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempPageController>(() => TempPageController());
  }
}
