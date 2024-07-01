import 'package:face_recognition/view/report/widgets/input_matricule_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:face_recognition/data/response/status.dart';
import 'package:face_recognition/res/components/internt_exceptions_widget.dart';
import 'package:face_recognition/res/components/general_exceptions_widget.dart';
import 'package:face_recognition/utils/utils.dart';
import 'package:face_recognition/res/colors/app_color.dart';

import 'package:face_recognition/view_models/controller/report/report_view_model.dart';

import '../home/home_view.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  late ReportViewModel checkController;
  late var image;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkController = Get.put(ReportViewModel());
    image = Get.arguments["image"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: Utils.appBar(),
        body: Obx(() {
          checkController.setImage(image);
          if (checkController.rxRequestStatus.value == Status.ERROR) {
            if (checkController.error.value == 'No internet connection') {
              return InternetExceptionsWidget(
                onPress: () {
                  checkController.setRxRequestStatus(Status.COMPLETED);
                },
              );
            } else {
              return GeneralExceptionsWidget(onPress: () {
                Get.to(() => const HomeView());
              });
            }
          } else {
            return   checkController.rxRequestStatus.value == Status.LOADING?
               const Center(
                child: CircularProgressIndicator(),
              )
            :  Center(
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
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [InputMatriculeWidget()],
                                  )),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (checkController.matriculeController.value.text.isNotEmpty) {
                                    checkController.sendReport();
                                  }
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
                              const SizedBox(height: 10),
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
                          backgroundImage: FileImage(File(image)),
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
