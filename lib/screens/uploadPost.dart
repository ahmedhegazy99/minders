import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:flutter/material.dart';

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost>
    with AutomaticKeepAliveClientMixin<UploadPost> {
  final _formKey = GlobalKey<FormState>();

  String error = '';

  //text field state
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    super.build(context);
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
                  "Write Post",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "englishBebas",
                      color: mindersMainY,
                      fontSize: 20),
                ),

                SizedBox(height: size.height * 0.01),

                RoundedInputField(
                  validator: (val) => val.isEmpty ? 'write post...' : null,
                  keyboardType: TextInputType.name,
                  hintText: "post",
                  controller: description,
                ),

                //SizedBox(height: size.height * 0.03),

                RoundedButton(
                    text: "sign up",
                    press: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: new Text(
                                "Enter your pin to proceed",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.black,
                              contentPadding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              children: [
                                //cancel button
                                SimpleDialogOption(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });

                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
