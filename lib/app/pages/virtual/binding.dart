import 'package:scape/app/pages/virtual/controller.dart';
import 'package:get/get.dart';

class VirtualPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VirtualPageController>(() => VirtualPageController());
  }
}
