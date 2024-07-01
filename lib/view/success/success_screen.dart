import 'package:flutter/material.dart';

import 'package:face_recognition/view_models/services/success_services.dart';
import 'package:face_recognition/res/colors/app_color.dart';

import '../../utils/utils.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  SuccessServices successServices = SuccessServices();

  @override
  void initState() {
    super.initState();
    successServices.successRedirection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: Utils.appBar(),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text("Feliciation", textAlign: TextAlign.center, style: TextStyle(
              fontWeight: FontWeight.w400,
                fontSize: 60,
              ),),
              SizedBox(height: 40),
              Icon(
                Icons.check_circle,
                color: AppColor.greenColor,
                size: 100,
              ),
              SizedBox(height: 40),
              Text("Votre enregistrement à bien été effectué", textAlign: TextAlign.center, style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 36,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
