import 'package:flutter/material.dart';

import 'package:face_recognition/view_models/services/splash_services.dart';
import 'package:face_recognition/res/assets/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Image(
              width: 200,
              height: 200,
              image: AssetImage(ImageAssets.splashScreen),
              fit: BoxFit.contain,
            ),
        ),
      ),
    );
  }
}
