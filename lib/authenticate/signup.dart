import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:Minders/services/auth.dart';
import 'package:Minders/services/database.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final AuthService _auth = AuthService();
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  String error = '';

  //text field state
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
        title: Center(child: Image.asset(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "englishBebas", color: mindersMainY, fontSize: 60),
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
                  validator: (val) => val.isEmpty ? 'Enter mobile number' : null,
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
                  validator: (val) => val.isEmpty ? "Password didn't match" : null,
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
                      //Navigator.pushNamed(context, '/mainBar');
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
                      if (_formKey.currentState.validate()) {
                        print(firstName);
                        print(lastName);
                        print(email);
                        print(mobile);
                        print(password);
                        print(confirmPass);

                        dynamic result = await _auth.emailSignup(firstName, lastName, email, mobile, password);

                        if (result == null) {
                          setState(() {
                            error = 'please supply a valid email';
                          });
                          _scaffoldKey.currentState.showSnackBar(new SnackBar(
                            content: Text(error, style: TextStyle(
                                color: mindersMainY,
                                fontWeight: FontWeight.bold),),
                            backgroundColor: Colors.red,
                          ));
                        }
                        else {
                          Navigator.pushNamed(context, '/mainBar');
                        }
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
