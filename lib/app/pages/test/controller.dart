import 'package:get/get.dart';
import 'package:scape/app/pages/account/widget/custom_field.dart';

class TestPageController extends GetxController {
  void openDialog() {
    Get.dialog(
      CustomFieldModal(),
      barrierDismissible: true,
      useSafeArea: true,
      transitionDuration: const Duration(milliseconds: 1),
    );
  }
}
