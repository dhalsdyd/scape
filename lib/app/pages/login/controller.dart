import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:scape/app/data/service/auth/service.dart';
import 'package:scape/app/routes/route.dart';
import 'package:scape/app/widgets/snackbar.dart';

class LoginPageController extends GetxController {
  AuthService authService = Get.find<AuthService>();

  Future<void> loginWithGoogle() async {
    try {
      await authService.logintWithGoogle();
      if (authService.isAuthenticated) Get.offAllNamed(Routes.root);
    } on DioError catch (e) {
      log("Please Working");
      log(e.response?.data.toString() ?? '로그인 실패');
      ScapeErrorSnackBar().open('로그인 실패');
    }
  }
}
