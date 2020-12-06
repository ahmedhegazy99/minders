import 'package:Minders/mainBar.dart';
import 'package:Minders/screens/about/about.dart';
import 'package:Minders/screens/authenticate/login.dart';
import 'package:Minders/screens/authenticate/signup.dart';
import 'package:Minders/screens/contactUs.dart';
import 'package:Minders/screens/home.dart';
import 'package:Minders/screens/profile.dart';
import 'package:Minders/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // General
  static const String homeRoute = '/';
  static const String aboutRoute = '/about';
  static const String contactRoute = '/contactUs';
  static const String splashRoute = '/splash';
  static const String mainBarRoute = '/mainBar';

  // Auth
  static const String loginRoute = '/login';
  static const String signupRoute = '/signUp';

  // User
  static const String userProfile = '/userProfile';

  static Route<dynamic> generateGlobalRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "\\":
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home(), settings: settings);
      case splashRoute:
        return MaterialPageRoute(builder: (_) => Splash(), settings: settings);
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Login(), settings: settings);
      case signupRoute:
        return MaterialPageRoute(builder: (_) => Signup(), settings: settings);
      case mainBarRoute:
        return MaterialPageRoute(builder: (_) => MainBar(), settings: settings);
      case contactRoute:
        return MaterialPageRoute(
            builder: (_) => ContactUs(), settings: settings);
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => About(), settings: settings);
      case userProfile:
        return MaterialPageRoute(builder: (_) => Profile(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => Home(), settings: settings);
    }
  }
}

//  routes: {
//         '/login': (context) => Login(),
//         '/signup': (context) => Signup(),
//         '/mainBar': (context) => MainBar(),
//       },
