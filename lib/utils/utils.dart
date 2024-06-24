import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:face_recognition/res/colors/app_color.dart';
import 'package:face_recognition/res/assets/image_assets.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        textColor: AppColor.whiteColor,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        textColor: AppColor.whiteColor,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }

  static snackBarError(String title, String message) {
    Get.snackbar(title, message, backgroundColor: AppColor.redColor, colorText: AppColor.whiteColor);
  }

  static AppBar app_Bar ({bool backButton = false}) {
    return AppBar(
      flexibleSpace: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Image(
          image:  AssetImage(ImageAssets.logoSah),
          width: 50,
          height: 80,
          fit: BoxFit.contain,
        ),
      ) ,
      backgroundColor: AppColor.blueColor,
      toolbarHeight: 120.0, // double
      automaticallyImplyLeading: backButton,
    );
  }
}
