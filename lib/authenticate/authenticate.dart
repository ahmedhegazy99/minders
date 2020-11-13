import 'package:flutter/material.dart';
import 'package:Minders/authenticate/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //to know what this can be used see flutter and firebase tutorial video no. 11
  /*
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    //return either sign up or sign in(login)
    return Signup();
  }
}
