import 'package:scape/app/core/theme/color_theme.dart';
import 'package:scape/app/data/initalize.dart';
import 'package:scape/app/routes/pages.dart';
import 'package:scape/app/routes/route.dart';
import 'package:scape/app/translation/translation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:scape/app/widgets/error.dart';

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
          dialogBackgroundColor: Colors.white,
          scaffoldBackgroundColor: ScapeColors.Gray60,
          textSelectionTheme: const TextSelectionThemeData(
              selectionColor: ScapeColors.Primary40)),
      locale: GetCurrentLocale.currentDeviceLocale,
      fallbackLocale: GetCurrentLocale.fallBackLocale,
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return ErrorMessageCard(
              errorMessage: errorDetails.exceptionAsString());
        };
        return widget!;
      },
      //routingCallback
      //GetObserver
    ),
  );
}
