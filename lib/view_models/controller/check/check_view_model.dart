import 'package:face_recognition/utils/utils.dart';
import 'package:face_recognition/view/success/success_screen.dart';
import 'package:get/get.dart';

import 'package:geolocator/geolocator.dart';

import 'package:face_recognition/repository/check_repository/check_repository.dart';
import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/models/home/user_model.dart';
import 'package:face_recognition/res/routes/routes_name.dart';

import 'package:face_recognition/view/report/report_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckViewModel extends GetxController {
  final _api = CheckRepository();
  final rxRequestStatus = Status.COMPLETED.obs;
  final rxUserStatus = Status.LOADING.obs;
  Rx<User?> user = User().obs;
  RxString image = "".obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setRxUserStatus(Status value) => rxUserStatus.value = value;

  void setError(String value) => error.value = value;

  void setUser(User value) => user.value = value;

  void setImage(String value) => image.value = value;

  void checkFoundUser() {
    if (user.value!.matricule != null) {
      setRxUserStatus(Status.COMPLETED);
    } else {
      setRxUserStatus(Status.ERROR);
    }
  }

  void submitUser() async {
    var site;
    getCurrentSiteValue().then((value) => site = value);
    setRxRequestStatus(Status.LOADING);
    Position position = await _determinePosition();
    user.value!.longitude = position.longitude;
    user.value!.latitude = position.latitude;
    var data = {
      'confidence': user.value?.confidence.toString(),
      'matricule': user.value?.matricule.toString(),
      'lon': user.value?.longitude.toString(),
      'lat': user.value?.latitude.toString(),
      'localisation_id': site.toString()
    };
    print(data);
    _api.saveUser(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print(value);
      if (value["success"]) {
        Utils.snackBarSuccess('success'.tr, value["message"].toString());
        Get.to(() => const SuccessScreen());
      } else {
        Utils.snackBarError('error'.tr, value["success"].toString());
        print("--- Response server ---");
        print(error.toString());
        print("------------");
      }
    }).onError((error, stackTrace) {
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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void report() {
    var data = {'image': image.value};
    Get.to(
        const ReportView(),
        arguments: data
    );
  }

  Future<int> getCurrentSiteValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("site") ?? "Danga";
    switch(value) {
      case "Campus":
        return 3;
      case "Danga":
        return 1;
      default:
        return 1;
    }

  }
}
