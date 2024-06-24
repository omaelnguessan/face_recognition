import 'package:face_recognition/view/check/check_view.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:face_recognition/repository/home_repository/home_repository.dart';
import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/utils/utils.dart';
import 'package:face_recognition/models/home/user_model.dart';


class HomeViewModel extends GetxController {
  final _api = HomeRepository();
  RxString image = "".obs;
  final _imagePicker = ImagePicker();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  File? imageUpload;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void setImage(String value) => image.value = value;
  static HomeViewModel get to => Get.find();

  Future getImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      setImage(pickedFile.path.toString());
      imageUpload = File(pickedFile.path);
    }
  }

  Future uploadFile() async {
    setRxRequestStatus(Status.LOADING);
    _api.userCheck(imageUpload).then((value) {
      print(value);
      setRxRequestStatus(Status.COMPLETED);
      User? user;
      if (value["success"]) {
        user = User.fromJson(value['predictions'][0]);
      }
      Get.to(
        const CheckView(),
        arguments: { 'user': user,  'image': imageUpload}
      );
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      Utils.snackBar('error'.tr, error.toString());
      print("--- Response server ---");
      print(error.toString());
      print("------------");
    });
  }


  void reload() {
    if (isClosed) return;
    setRxRequestStatus(Status.LOADING);
    setImage("");
    setRxRequestStatus(Status.COMPLETED);
  }

  void start() {
    if (isClosed) return;
    setRxRequestStatus(Status.COMPLETED);
    setImage("");
  }

}