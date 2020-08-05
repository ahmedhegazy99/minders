import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

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
                    _email = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter Second Name' : null,
                  keyboardType: TextInputType.name,
                  hintText: "Second Name",
                  onChanged: (value) {
                    _email = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  icon: Icons.mail,
                  onChanged: (value) {
                    _email = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'Enter mobile number' : null,
                  keyboardType: TextInputType.phone,
                  hintText: "Mobile Number",
                  icon: Icons.phone,
                  onChanged: (value) {
                    _email = value;
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
                    _password = value;
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
                    _password = value;
                  },
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedButton(
                    text: "sign up",
                    press: () async {

                      Navigator.pushNamed(context, '/mainBar');
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
