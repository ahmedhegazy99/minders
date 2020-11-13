import 'package:Minders/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Minders/components/roundedButton.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                    text: "  email",
                    icon: Icon(
                      Icons.mail,
                      color: mindersMainY,
                      size: size.width * 0.1,
                    ),
                    color: Colors.black,
                    textColor: mindersMainY,
                    press: () {
                      launch("mailto:info@minders-fci.org?");
                    },
                  ),
                  RoundedButton(
                    text: "  Whatsapp",
                    icon: Image.asset(
                      "assets/images/whatsapp.png",
                      width: size.width * 0.5,
                    ),
                    color: Color(0xff25d366),
                    textColor: Colors.white,
                    press: () {
                      launch("https://wa.me/201552244794");
                    },
                  ),
                  RoundedButton(
                    text: "  Messanger",
                    icon: Image.asset(
                      "assets/images/messenger.png",
                      scale: 8,
                    ),
                    color: Color(0xff00b2ff),
                    textColor: Colors.white,
                    press: () {
                      launch("https://m.me/MindersFCIH?");
                    },
                  ),
                  SizedBox(height: size.height * 0.06),
                  Text(
                    "Want to make a Deal ?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "englishTex",
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  RoundedButton(
                    text: "Contact FR",
                    //icon: Icon(Icons.mail),
                    //color: Color(0xff25d366),
                    press: () {
                      launch(
                          "mailto:fundraisingminder@gmail.com?subject=We Have a Deal");
                    },
                  ),
                  Text(
                    "Want a Partnership ?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "englishTex",
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  RoundedButton(
                    text: "Contact PR",
                    //icon: Icon(Icons.mail),
                    //color: Color(0xff25d366),
                    press: () {
                      launch("mailto:info@minders-fci.org?");
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
