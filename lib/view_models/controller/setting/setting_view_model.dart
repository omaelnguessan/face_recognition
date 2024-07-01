import 'package:get/get.dart';

import 'package:face_recognition/data/response/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils.dart';

class SettingViewModel extends GetxController {

  final rxRequestStatus = Status.COMPLETED.obs;
  RxString site = "".obs;
  List<String> list = <String>['Campus', 'Danga'];

  RxString error = ''.obs;
  void setSite(String value) => site.value = value;

  updateDropdown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("site", site.value);
    Utils.snackBarSuccess('Success'.tr, "Site modifié avec succèss");
  }

  void getCurrentSiteValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("site") ?? "Danga";
    setSite(value);
  }

}
