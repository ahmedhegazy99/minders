import 'package:Minders/authenticate/login.dart';
import 'package:Minders/authenticate/signup.dart';
import 'package:flutter/material.dart';
import 'package:Minders/mainBar.dart';

void main() => runApp(MaterialApp(
  //home: mainBar(),
  home: Login(),
  //initialRoute: '/',
  routes: {
    //'/': (context) => Loading(),
    '/mainBar': (context) => mainBar(),
    '/signup': (context) => Signup(),
  },
));