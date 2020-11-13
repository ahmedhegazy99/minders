import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: size.height * 0.03),
                  RoundedButton(
                    text: "Log Out",
                    //icon: Icon(Icons.mail, color: mindersMainY, size: size.width * 0.1,),
                    color: Colors.red,
                    textColor: Colors.white,
                    press: () async {
                      print("logout clicked");
                      Get.find<AuthController>().signOut();
                      print("signed out");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
