import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/userModel.dart';
import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/utils/appRouter.dart';
import 'package:Minders/utils/utilFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseUser = Rx<FirebaseUser>();
  var loading = false.obs;

  FirebaseUser get user => _firebaseUser.value;

  @override
  void onReady() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
    ever(_firebaseUser, (_) async {
      if (_ != null) {
        Get.find<UserController>().user =
            await Get.find<DatabaseController>().getUser(_.uid);
      }
    });
    ever(loading, (val) {
      if (val)
        Get.defaultDialog(
            title: 'loading'.tr, content: CircularProgressIndicator());
      else
        Get.back();
    });
  }

  void createUser(String firstName, String lastName, String email,
      String mobile, String password) async {
    try {
      loading.toggle();
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      UserModel _user = UserModel(
          id: _authResult.user.uid,
          firstName: firstName,
          lastName: lastName,
          mobile: mobile,
          email: email);
      await Get.find<DatabaseController>().createNewUser(_user);
      Get.offAllNamed(AppRouter.mainBarRoute);
      loading.toggle();
      Get.back();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }

  void login(String email, String password) async {
    try {
      loading.toggle();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(AppRouter.mainBarRoute);
      loading.toggle();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }

  void signOut() async {
    try {
      loading.toggle();
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.offAllNamed(AppRouter.loginRoute);
      loading.toggle();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }
}
