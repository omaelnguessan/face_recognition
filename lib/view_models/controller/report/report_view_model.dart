import 'dart:ffi';

import 'package:face_recognition/utils/utils.dart';
import 'package:get/get.dart';

import 'package:geolocator/geolocator.dart';

import 'package:face_recognition/repository/check_repository/check_repository.dart';
import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/models/home/user_model.dart';
import 'package:face_recognition/res/routes/routes_name.dart';

class ReportViewModel extends GetxController {
  final _api = CheckRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final rxUserStatus = Status.LOADING.obs;
  Rx<User?> user = User().obs;
  RxString image = "".obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void setUser(User value) => user.value = value;
  void setImage(String value) => image.value = value;

  void checkFoundUser() {

  }

  void submitUser() async {
    setRxRequestStatus(Status.LOADING);
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    user.value!.longitude = position.longitude;
    user.value!.latitude = position.latitude;
    _api.saveUser(user.toJson()).then((value) => null).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      Utils.snackBarError('error'.tr, error.toString());
      print("--- Response server ---");
      print(error.toString());
      print("------------");
    });

  }

  void registerAgain() {
    Get.toNamed(RoutesName.homeView)!.then((value) {});
  }

  void loginReport() {

  }


}