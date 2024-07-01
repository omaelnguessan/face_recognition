import 'dart:io';
import 'package:face_recognition/res/routes/routes_name.dart';
import 'package:face_recognition/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/repository/report_repository/report_repository.dart';


class ReportViewModel extends GetxController {
  final _api = ReportRepository();
  final rxRequestStatus = Status.COMPLETED.obs;
  RxString image = "".obs;

  final matriculeController = TextEditingController().obs;
  final matriculeFocusNode = FocusNode().obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setError(String value) => error.value = value;

  void setImage(String value) => image.value = value;

  void sendReport() async {
    setRxRequestStatus(Status.LOADING);
    File imageUser = File(image.value);
    var data ={ "matricule": matriculeController.value.text};
    _api
        .report(data, imageUser)
        .then((value) {
          setRxRequestStatus(Status.COMPLETED);
          if(value["success"]) {
            Utils.snackBarSuccess('Success'.tr, value["message"]);
            Get.to(RoutesName.homeView);
          } else {
            Utils.snackBarError('error'.tr, "Erreur lors de l'enregistrement");
          }
    })
        .onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      Utils.snackBarError('error'.tr, "Erreur lors de l'enregistrement");
      print("--- Response server ---");
      print(error.toString());
      print("------------");
    });
  }
}
