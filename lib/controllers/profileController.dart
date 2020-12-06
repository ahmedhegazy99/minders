import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/models/userModel.dart';
import 'package:Minders/utils/utilFunctions.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final String userId;
  ProfileController({this.userId});

  var _user = Rx<UserModel>();
  UserModel get user => _user.value;

  var posts = Rx<List<PostModel>>([]);

  var loading = RxBool(true);

  @override
  void onInit() async {
    await getUser();
    await getUserPosts();
    loading.value = false;
    super.onInit();
  }

  Future<void> getUser() async {
    try {
      _user.value = await Get.find<DatabaseController>().getUser(userId);

      return;
    } catch (e) {
      displayError(e);
      return;
    }
  }

  Future<void> getUserPosts() async {
    try {
      print(userId);
      posts.value = await Get.find<DatabaseController>().getUserPosts(userId);

      return;
    } catch (e) {
      displayError(e);
      return;
    }
  }
}
