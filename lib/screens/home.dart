import 'package:Minders/components/createPost.dart';
import 'package:Minders/controllers/databaseController.dart';
import 'package:flutter/material.dart';
import 'package:Minders/screens/postCard.dart';
import 'package:get/get.dart';

class Home extends GetWidget<DatabaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Obx(() {
          if (controller.loading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (controller.posts.isEmpty)
            return Column(
              children: [
                CreatePost(),
                Center(
                  child: Text('noPosts'.tr),
                ),
              ],
            );

          return RefreshIndicator(
            onRefresh: () async {
              await Get.find<DatabaseController>().getPosts();
            },
            child: ListView.builder(
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
            ),
          );
        }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: "Create Post",
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.black,
      //   ),
      //   backgroundColor: mindersMainY,
      //   onPressed: () {
      //     Get.to(UploadPost());
      //   },
      // ),
    );
  }
}
