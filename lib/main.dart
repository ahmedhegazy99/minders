import 'package:Minders/authenticate/login.dart';
import 'package:Minders/authenticate/signup.dart';
import 'package:Minders/models/user.dart';
import 'package:Minders/screens/home.dart';
import 'package:Minders/screens/uploadPost.dart';
import 'package:Minders/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:Minders/mainBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          //primaryColorLight: cayshlyLight,
          //primaryColorDark: cayshlyDark,
        ),
//        home: Wrapper(),
        home: AuthService().handleAuth(),
        //initialRoute: '/',
        routes: {
          //'/': (context) => Loading(),
          '/home': (context) => home(),
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          '/mainBar': (context) => mainBar(),
          '/uploadPage': (context) => UploadPost(),

        },
      ),
    );
  }
}

/*
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
*/