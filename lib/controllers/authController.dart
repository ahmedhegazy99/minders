import 'package:Minders/controllers/loadingController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/userModel.dart';
import 'package:Minders/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseUser = Rx<FirebaseUser>();
  var loading = false.obs;

  FirebaseUser get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
    ever(_firebaseUser, (_) async {
      if (_ != null) {
        Get.find<UserController>().user = await db.getUser(_.uid);
      }
    });
    ever(loading, (val) {
      print(val);
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
      await db.createNewUser(_user);
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
      loading.toggle();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }

  void displayError(dynamic e) {
    Get.snackbar(
      "error".tr,
      e.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }
}
