import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:face_recognition/view_models/controller/home/home_view_model.dart';
import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/res/components/internt_exceptions_widget.dart';
import 'package:face_recognition/res/components/general_exceptions_widget.dart';
import 'package:face_recognition/utils/utils.dart';
import 'package:face_recognition/res/colors/app_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel homeController;

  @override
  void initState() {
    super.initState();
    homeController = Get.put(HomeViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.appBar(),
        body: Obx(() {
          if (homeController.rxRequestStatus.value == Status.ERROR) {
            if (homeController.error.value == 'No internet connection') {
              return InternetExceptionsWidget(
                onPress: () {
                  homeController.reload();
                },);
            } else {
              return GeneralExceptionsWidget(onPress: () {
                homeController.reload();
              });
            }
          } else if(homeController.rxRequestStatus.value == Status.LOADING) {
            //homeController.init();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(
                  "welcome".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeController.getImage();
                },
                child: Container(
                  child: homeController.image.value == ""
                      ? const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.photo_camera,
                                size: 50,
                                color: AppColor.blueColor,
                              ),
                              Text('Cliquer ici pour prendre une photo')
                            ],
                          ),
                        )
                      : Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(File(
                                      homeController.image.value.toString())),
                                  fit: BoxFit.fill)),
                        ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  homeController.image.value == "" ? null: homeController.uploadFile();
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: AppColor.whiteColor,
                ),
                label: const Text(
                  "Je m'enregistre",
                  style: TextStyle(color: AppColor.whiteColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.orangeColor,
                  textStyle: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          );
          }
        }));
  }
}
