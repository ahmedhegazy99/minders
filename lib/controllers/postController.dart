import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/models/replyModel.dart';
import 'package:Minders/models/userModel.dart';
import 'package:Minders/utils/utilFunctions.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var _postsStream = Rx<List<PostModel>>();

  List<PostModel> get posts => _postsStream.value;

  @override
  void onInit() {
    _postsStream.bindStream(Get.find<DatabaseController>().getPosts());
    super.onInit();
  }

  Future<void> toggleIsLiked(PostModel post) async {
    try {
      final UserModel user = Get.find<UserController>().user;
      final db = Get.find<DatabaseController>();

      if (post.upvotes?.contains(user.id) == true) {
        post.upvotes.remove(user.id);
      } else {
        if (post.upvotes == null) {
          post.upvotes = [];
        }
        post.upvotes.add(user.id);
      }

      await db.updatePost(post);

      return;
    } catch (e) {
      displayError(e);
      return;
    }
  }
}
