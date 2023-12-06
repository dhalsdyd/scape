import 'package:scape/app/data/module/account/module.dart';
import 'package:scape/app/data/module/account/repository.dart';
import 'package:scape/app/data/module/email/module.dart';
import 'package:scape/app/data/module/email/repository.dart';
import 'package:scape/app/data/provider/api.dart';
import 'package:scape/app/pages/home/controller.dart';
import 'package:scape/app/pages/inbox/controller.dart';
import 'package:scape/app/pages/privacy/controller.dart';
import 'package:scape/app/pages/root/controller.dart';
import 'package:get/get.dart';
import 'package:scape/app/pages/virtual/controller.dart';

class RootPageBinding implements Bindings {
  @override
  void dependencies() {
    // Bottom Navigation
    Get.lazyPut<RootPageController>(() => RootPageController());
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<InboxPageController>(() => InboxPageController());
    Get.lazyPut<VirtualPageController>(() => VirtualPageController());
    Get.lazyPut<PrivacyPageController>(() => PrivacyPageController());

    // Modules
    Get.put<AccountController>(AccountController(
        repository: AccountRepository(api: ScapeApiProvider())));
    Get.put<EmailController>(
        EmailController(repository: EmailRepository(api: ScapeApiProvider())));
  }
}
