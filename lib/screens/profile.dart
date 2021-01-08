import 'dart:math';

import 'package:Minders/components/postCard.dart';
import 'package:Minders/components/roundedButton.dart';
import 'package:Minders/controllers/authController.dart';
import 'package:Minders/controllers/mainBarController.dart';
import 'package:Minders/controllers/profileController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userId = Get.find<MainBarController>().userId.value;
    String currentUserId = Get.find<UserController>().user.id;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: GetX<ProfileController>(
            init: ProfileController(userId: userId ?? currentUserId),
            builder: (_) {
              if (_.loading.value) {
                return Container(
                    height: Get.height,
                    child: Center(child: CircularProgressIndicator()));
              }
              return Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(_.user?.imageUrl ??
                          'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                      radius: 40,
                    ),
                    Text(
                      _.user?.firstName ?? '',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    if (userId == null)
                      RoundedButton(
                        text: "Log Out",
                        color: Colors.red,
                        textColor: Colors.white,
                        press: () async {
                          Get.find<AuthController>().signOut();
                        },
                      ),
                    ..._.posts.value
                        .map((e) => PostCard(
                              post: e,
                            ))
                        .toList(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
