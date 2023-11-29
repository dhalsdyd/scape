import 'package:scape/app/pages/home/controller.dart';
import 'package:scape/app/pages/inbox/controller.dart';
import 'package:scape/app/pages/root/controller.dart';
import 'package:get/get.dart';

class RootPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootPageController>(() => RootPageController());
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<InboxPageController>(() => InboxPageController());
  }
}
