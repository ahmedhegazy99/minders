import 'package:Minders/components/createPost.dart';
import 'package:Minders/controllers/postController.dart';
import 'package:flutter/material.dart';
import 'package:Minders/components/postCard.dart';
import 'package:get/get.dart';

class Home extends GetWidget<PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Obx(() {
          if (controller.posts?.isEmpty == true || controller.posts == null)
            return Column(
              children: [
                CreatePost(),
                Center(
                  child: Text('noPosts'.tr),
                ),
              ],
            );

          return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: controller.posts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CreatePost();
              }
              return PostCard(
                post: controller.posts[index - 1],
              );
            },
          );
        }),
      ),
    );
  }
}
