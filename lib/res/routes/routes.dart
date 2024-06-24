import 'package:get/get.dart';

import 'package:face_recognition/res/routes/routes_name.dart';
import 'package:face_recognition/view/splash_screen.dart';
import 'package:face_recognition/view/home/home_view.dart';

import '../../view/check/check_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.homeView,
            page: () => const HomeView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
    GetPage(
        name: RoutesName.checkView,
        page: () =>  const CheckView(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 250))
      ];
}
