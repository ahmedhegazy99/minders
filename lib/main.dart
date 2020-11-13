import 'package:Minders/authenticate/login.dart';
import 'package:Minders/authenticate/signup.dart';
import 'package:Minders/controllers/bindings/authBinding.dart';
import 'package:Minders/screens/home.dart';
import 'package:Minders/screens/splash.dart';
import 'package:Minders/screens/uploadPost.dart';
import 'package:Minders/utils/locales.dart';
import 'package:flutter/material.dart';
import 'package:Minders/mainBar.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Locales(),
      locale: Locale('en'),
      initialBinding: AuthBinding(),
      home: Splash(),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/mainBar': (context) => MainBar(),
        '/uploadPage': (context) => UploadPost(),
      },
    );
  }
}
