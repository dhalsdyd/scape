import 'package:scape/app/core/middleware/login.dart';
import 'package:scape/app/pages/account/binding.dart';
import 'package:scape/app/pages/account/page.dart';
import 'package:scape/app/pages/login/binding.dart';
import 'package:scape/app/pages/login/page.dart';
import 'package:scape/app/pages/root/binding.dart';
import 'package:scape/app/pages/root/page.dart';
import 'package:scape/app/pages/test/binding.dart';
import 'package:scape/app/pages/test/page.dart';
import 'package:scape/app/routes/route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.test,
        page: () => const TestPage(),
        binding: TestPageBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginPageBinding()),
    GetPage(
        name: Routes.root,
        page: () => const RootPage(),
        binding: RootPageBinding(),
        middlewares: [LoginMiddleware()]),
    GetPage(
        name: Routes.account_setting,
        page: () => const AccountSettingPage(),
        binding: AccountSettingPageBindng(),
        middlewares: [LoginMiddleware()]),
  ];
}
