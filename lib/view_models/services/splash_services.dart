import 'package:get/get.dart';
import 'dart:async';

import 'package:face_recognition/res/routes/routes_name.dart';

class SplashServices {

  void isLogin() {
    String routesName = RoutesName.homeView;
    Timer(const Duration(seconds: 3), () => Get.toNamed(routesName));
  }
}
