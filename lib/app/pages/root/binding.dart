import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/root/controller.dart';
import 'package:get/get.dart';

class RootPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootPageController>(() => RootPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    
  }
}
