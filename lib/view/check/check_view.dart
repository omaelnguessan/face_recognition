import 'package:face_recognition/view/check/widget/information_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:face_recognition/view_models/controller/check/check_view_model.dart';
import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/res/components/internt_exceptions_widget.dart';
import 'package:face_recognition/res/components/general_exceptions_widget.dart';
import 'package:face_recognition/utils/utils.dart';
import 'package:face_recognition/res/colors/app_color.dart';

class CheckView extends StatefulWidget {
  const CheckView({super.key});

  @override
  State<CheckView> createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView> {
  final checkController = Get.put(CheckViewModel());
  var user;
  var image;

  @override
  void initState() {
    super.initState();
    image = Get.arguments["image"];
    user = Get.arguments["user"];
    if(user != null) {
      checkController.setUser(user);
      checkController.setRxUserStatus(Status.COMPLETED);
    }
    checkController.setRxRequestStatus(Status.COMPLETED);
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: Utils.app_Bar(),
        body: Obx(() {
          if (checkController.rxRequestStatus.value == Status.ERROR) {
            if (checkController.error.value == 'No internet connection') {
              return InternetExceptionsWidget(
                onPress: () {},
              );
            } else {
              return GeneralExceptionsWidget(onPress: () {});
            }
          } else if (checkController.rxRequestStatus.value == Status.LOADING) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "INFORMATION",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 100),
                  const SizedBox(height: 40),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        color: AppColor.whiteColor,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(60, 70.0, 60, 16.0),
                          child: checkController.rxUserStatus.value ==
                                  Status.COMPLETED
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InformationRow(
                                        label: 'Matricule:',
                                        value: checkController
                                            .user.value!.matricule),
                                    InformationRow(
                                        label: 'Nom & Prénoms:',
                                        value: checkController.user.value!.name),
                                    InformationRow(
                                        label: 'Département:',
                                        value: checkController
                                            .user.value!.department),
                                    InformationRow(
                                        label: 'Poste:',
                                        value: checkController
                                            .user.value!.designation),
                                    const SizedBox(height: 80),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        checkController.submitUser();
                                      },
                                      icon: const Icon(
                                        Icons.check_circle,
                                        color: AppColor.whiteColor,
                                      ),
                                      label: const Text(
                                        "Valider",
                                        style: TextStyle(color: AppColor.whiteColor),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.orangeColor,
                                        textStyle: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    const SizedBox(
                                        height: 80),
                                   const Icon(
                                      Icons.cancel,
                                      color: AppColor.redColor,
                                      size: 100,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Erreur, veuillez effectuer un nouveau enregistrement',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 40),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        checkController.registerAgain();
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
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Utilisez une autre méthode',
                                        style: TextStyle(
                                            color: Color(
                                                0xFFF57C00)), // Match the color with the button color
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      Positioned(
                        width: 150,
                        height: 150,
                        top: -80,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(image.path)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80)
                ],
              ),
            );
          }
        }));
  }
}
