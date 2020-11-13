import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController mobile = TextEditingController();

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
                  controller: firstName,
                ),
                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter Second Name' : null,
                  keyboardType: TextInputType.name,
                  hintText: "Second Name",
                  controller: lastName,
                ),
                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  icon: Icons.mail,
                  controller: email,
                ),
                RoundedInputField(
                  validator: (val) =>
                      val.isEmpty ? 'Enter mobile number' : null,
                  keyboardType: TextInputType.phone,
                  hintText: "Mobile Number",
                  icon: Icons.phone,
                  controller: mobile,
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an password' : null,
                  color: Colors.white,
                  textColor: Colors.black,
                  obscureText: true,
                  icon: Icons.lock,
                  hintText: "Password",
                  controller: password,
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
                  controller: confirmPassword,
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedButton(
                    text: "sign up",
                    press: () async {
                      if (_formKey.currentState.validate() &&
                          password.text == confirmPassword.text) {
                        controller.createUser(firstName.text, lastName.text,
                            email.text, mobile.text, password.text);
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
