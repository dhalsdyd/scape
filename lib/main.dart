import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/data/initalize.dart';
import 'package:firebase_getx_boilerplate/app/routes/pages.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/translation/translation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() async {
  //WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // loading
  // FlutterNativeSplash.remove(widgetsBinding: widgetsBinding);

  await AppInitalizer().init();
  //Get.config();
  runApp(
    GetMaterialApp(
      //unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: Routes.root,
      getPages: AppPages.pages,
      theme: ThemeData(
          fontFamily: "Pretendard",
          textSelectionTheme: const TextSelectionThemeData(
              selectionColor: ScapeColors.Primary40)),
      locale: GetCurrentLocale.currentDeviceLocale,
      fallbackLocale: GetCurrentLocale.fallBackLocale,
      //routingCallback
      //GetObserver
    ),
  );
}
