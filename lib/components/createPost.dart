import 'dart:io';

import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends GetWidget<UserController> {
  final text = TextEditingController();
  final image = Rx<File>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Color(0xFF1777F2),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(controller.user.imageUrl ??
                          "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: TextField(
                  controller: text,
                  decoration: InputDecoration.collapsed(
                    hintText: 'whatIsInYourMind'.tr,
                  ),
                ),
              )
            ],
          ),
          const Divider(height: 20.0, thickness: 0.5),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.getImage(source: ImageSource.gallery);
                    image.value = File(pickedFile.path);
                  },
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.lightGreen,
                    size: 20,
                  ),
                  label: Text('image'.tr),
                ),
                const VerticalDivider(width: 8.0),
                FlatButton.icon(
                  onPressed: () async {
                    if (text.text.isEmpty)
                      Get.snackbar('cantPost'.tr, 'empty'.tr,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    else {
                      PostModel post = PostModel();
                      if (image.value != null)
                        post.type = PostTypeEnum.photo;
                      else
                        post.type = PostTypeEnum.text;

                      post.text = text.text;
                      post.userId = controller.user.id;
                      post.userImage = controller.user.imageUrl;
                      post.userName =
                          '${controller.user.firstName} ${controller.user.lastName}';
                      post.date = DateTime.now();
                      post.replies = [];
                      post.upvotes = [];

                      await Get.find<DatabaseController>()
                          .addPost(post, image: image.value);

                      image.value = null;
                      text.clear();
                    }
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.deepPurpleAccent,
                    size: 20,
                  ),
                  label: Text('post'.tr),
                ),
              ],
            ),
          ),
          GetX<DatabaseController>(
            init: DatabaseController(),
            builder: (controller) {
              if (controller.uploading.value) return LinearProgressIndicator();
              return Container();
            },
          )
        ],
      ),
    );
  }
}
