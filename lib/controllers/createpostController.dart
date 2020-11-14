import 'dart:io';

import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatepostController extends GetxController {
  Rx<TextEditingController> textController;
  Rx<File> image;

  @override
  void onInit() {
    textController = Rx<TextEditingController>();
    image = Rx<File>();
    super.onInit();
  }

  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image.value = File(pickedFile.path);
  }

  void removeImage() async {
    image.value = null;
  }

  Future<void> postPost() async {
    UserModel user = Get.find<UserController>().user;
    if (textController.value.text.isEmpty)
      Get.snackbar('cantPost'.tr, 'empty'.tr,
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    else {
      PostModel post = PostModel();
      if (image.value != null)
        post.type = PostTypeEnum.photo;
      else
        post.type = PostTypeEnum.text;

      post.text = textController.value.text;
      post.userId = user.id;
      post.userImage = user.imageUrl;
      post.userName = '${user.firstName} ${user.lastName}';
      post.date = DateTime.now();
      post.replies = [];
      post.upvotes = [];

      await Get.find<DatabaseController>().addPost(post, image: image.value);

      image.value = null;
      textController.value.clear();
    }
  }
}
