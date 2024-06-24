import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:face_recognition/res/components/round_button.dart';
import 'package:face_recognition/res/colors/app_color.dart';

class GeneralExceptionsWidget extends StatefulWidget {
  final VoidCallback onPress;

  const GeneralExceptionsWidget({super.key, required this.onPress});

  @override
  State<GeneralExceptionsWidget> createState() =>
      _GeneralExceptionsWidgetState();
}

class _GeneralExceptionsWidgetState extends State<GeneralExceptionsWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColor.redColor,
              size: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                'general_exception'.tr,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(
              height: height * .15,
            ),
            RoundButton(title: 'back_to_home'.tr, onPress: widget.onPress),

          ],
        ),
      ),
    );
  }
}
