import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/components/roundedInputField.dart';
import 'package:Minders/components/background.dart';
import 'package:Minders/components/constants.dart';
import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPost extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController description = TextEditingController();

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
                    text: "addPost".tr,
                    press: () async {
                      UserModel user = Get.find<UserController>().user;
                      Get.find<DatabaseController>().addPost(PostModel(
                        contentUrl: '',
                        date: DateTime.now(),
                        text: description.text,
                        type: PostTypeEnum.photo,
                        userId: user.id,
                        userImage: user.imageUrl,
                        userName: '${user.firstName} ${user.lastName}',
                      ));
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
