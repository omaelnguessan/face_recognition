import 'package:flutter/material.dart';

import 'package:face_recognition/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.buttonColor = AppColor.orangeColor,
      this.textColor = AppColor.primaryTextColor,
      required this.title,
      required this.onPress,
      this.width = 160,
      this.height = 44,
      this.loading = false});

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          //onTap: onPress,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: loading
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
          )),
    );
  }
}
