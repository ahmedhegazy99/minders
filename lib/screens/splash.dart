import 'package:Minders/authenticate/login.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:Minders/mainBar.dart';
import 'package:Minders/screens/home.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'assets/images/Hlogo.png',
      home: Obx(
        () {
          if (controller.user?.uid != null) {
            return MainBar();
          } else
            return Login();
        },
      ),
      duration: 3000,
      type: AnimatedSplashType.StaticDuration,
    );
  }
}
