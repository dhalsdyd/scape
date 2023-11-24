import 'package:get/get.dart';

class LifeCycleController extends FullLifeCycleController
    with FullLifeCycleMixin {
  // Mandatory
  @override
  void onDetached() {}

  // Mandatory
  @override
  void onInactive() {}

  // Mandatory
  @override
  void onPaused() {}

  // Mandatory
  @override
  void onResumed() {}
  
  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
