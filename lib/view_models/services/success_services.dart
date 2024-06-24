import 'package:get/get.dart';
import 'dart:async';

import 'package:face_recognition/res/routes/routes_name.dart';

class SuccessServices {

  void successRedirection() {
    String routesName = RoutesName.successView;
    Timer(const Duration(seconds: 3), () => Get.toNamed(routesName));
  }
}
