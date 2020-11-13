import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  String error = '';

  String firstName = "";
  String lastName = "";
  String email = "";
  String mobile = "";
  String password = "";
  String confirmPass = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            'assets/images/Hlogo.png',
            fit: BoxFit.contain,
            height: 100,
            width: 100,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "englishBebas",
                      color: mindersMainY,
                      fontSize: 60),
                ),

                SizedBox(height: size.height * 0.01),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter First Name' : null,
                  keyboardType: TextInputType.name,
                  hintText: "First Name",
                  onChanged: (value) {
                    firstName = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter Second Name' : null,
                  keyboardType: TextInputType.name,
                  hintText: "Second Name",
                  onChanged: (value) {
                    lastName = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  icon: Icons.mail,
                  onChanged: (value) {
                    email = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) =>
                      val.isEmpty ? 'Enter mobile number' : null,
                  keyboardType: TextInputType.phone,
                  hintText: "Mobile Number",
                  icon: Icons.phone,
                  onChanged: (value) {
                    mobile = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an password' : null,
                  color: Colors.white,
                  textColor: Colors.black,
                  obscureText: true,
                  icon: Icons.lock,
                  hintText: "Password",
                  onChanged: (value) {
                    password = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) =>
                      val.isEmpty ? "Password didn't match" : null,
                  color: Colors.white,
                  textColor: Colors.black,
                  obscureText: true,
                  icon: Icons.lock,
                  hintText: "Confirm Password",
                  onChanged: (value) {
                    confirmPass = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedButton(
                    text: "sign up",
                    press: () async {
                      if (_formKey.currentState.validate() &&
                          password == confirmPass) {
                        Get.find<AuthController>().createUser(
                            firstName, lastName, email, mobile, password);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
