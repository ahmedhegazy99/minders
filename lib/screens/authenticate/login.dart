import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:Minders/utils/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(),
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
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "englishBebas",
                      color: mindersMainY,
                      fontSize: 60),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.person,
                  hintText: "Email",
                  controller: emailController,
                ),
                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an password' : null,
                  color: Colors.white,
                  textColor: Colors.black,
                  obscureText: true,
                  icon: Icons.lock,
                  hintText: "Password",
                  controller: passwordController,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouter.signupRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        "you don't have an account? Sign Up.",
                        style: TextStyle(color: mindersMainY, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                RoundedButton(
                    text: "login",
                    press: () async {
                      //to sign in with email and password
                      if (_formKey.currentState.validate()) {
                        controller.login(
                            emailController.text, passwordController.text);
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
