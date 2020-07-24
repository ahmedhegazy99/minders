import 'package:flutter/material.dart';
import 'package:Minders/mainBar.dart';

void main() => runApp(MaterialApp(
  home: mainBar(),
  //initialRoute: '/',
  routes: {
    //'/': (context) => Loading(),
    '/mainBar': (context) => mainBar(),
    //'/home': (context) => home(),
  },
));