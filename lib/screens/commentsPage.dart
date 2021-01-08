import 'package:Minders/components/commentCard.dart';
import 'package:Minders/controllers/commentController.dart';
import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/models/replyModel.dart';
import 'package:Minders/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CommentsList extends StatelessWidget {
  final String postId;
  CommentsList({Key key, this.postId}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentController(postId: postId));
    return Scaffold(
      appBar: AppBar(
        title: Text('comments'.tr),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            child: Column(
              children: [
                Obx(() {
                  if (controller.comments != null &&
                      controller.comments.length > 0)
                    return Expanded(
                      child: ListView.builder(
                          itemCount: controller.comments.length,
                          itemBuilder: (context, index) => CommentCard(
                                comment: controller.comments[index],
                              )),
                    );
                  else
                    return Expanded(
                      child: Center(
                        child: Text('noComments'.tr),
                      ),
                    );
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'writeComment'.tr,
                              labelStyle: TextStyle(color: Colors.blue),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                          controller: textController,
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            UserModel user = Get.find<UserController>().user;
                            if (user != null &&
                                textController.text.isNotEmpty) {
                              var comment = ReplyModel(
                                date: DateTime.now(),
                                content: textController.text,
                                userId: user.id,
                                userImage: user.imageUrl,
                                userName: user.firstName + ' ' + user.lastName,
                                postId: postId,
                              );
                              Get.find<DatabaseController>()
                                  .addComment(comment);
                              textController.clear();
                            }
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
