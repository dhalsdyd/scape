import 'package:get/get.dart';
import 'package:scape/app/data/local/getx_storage.dart';
import 'package:scape/app/data/provider/api.dart';
import 'package:scape/app/data/service/auth/repository.dart';
import 'package:scape/app/data/service/auth/service.dart';

class AppInitalizer {
  Future<void> init() async {
    Get.put(LocalDatabase());
    await Future.wait([
      Get.putAsync(
          () => AuthService(AuthRepository(ScapeApiProvider())).init()),
    ]);
  }
}
