import 'package:face_recognition/res/colors/app_color.dart';
import 'package:face_recognition/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:face_recognition/res/getx_localization/langagues.dart';
import 'package:face_recognition/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Recognition',
      translations: Languages(),
      locale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('fr', 'FR'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.blueColor),
        useMaterial3: true,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                  color: AppColor.whiteColor
              )
          )
      ),
      getPages: AppRoutes.appRoutes(),
      home: const SplashScreen(),
    );
  }
}
