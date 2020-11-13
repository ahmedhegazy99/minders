import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String error = 'please supply a valid email';

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
                  onChanged: (value) {
                    email = value;
                  },
                ),
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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
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
                      Navigator.pushNamed(context, '/signup');
                      /*
                      Auth myauth = new Auth();

                      if (_password == adminPassword) {
                        try {
                          await myauth.signIn(_email, _password);
                          Navigator.pushNamed(context, StoreHome.id);
                        }
                        catch(e){
                          print(e);
                        }

                      }
                      else {
                        final authResult = await myauth.signIn(_email, _password);
                        print(authResult);

                        if (authResult.user.uid != null) {
                          print("success");
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        } else {
                          print("Eror");
                        }
                      }
*/

                      //to sign in with email and password
                      if (_formKey.currentState.validate()) {
                        Get.find<AuthController>().login(email, password);
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
