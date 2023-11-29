import 'package:scape/app/pages/inbox/controller.dart';
import 'package:get/get.dart';

class InboxPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxPageController>(() => InboxPageController());
  }
}
