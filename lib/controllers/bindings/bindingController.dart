import 'package:Minders/controllers/authController.dart';
import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/mainBarController.dart';
import 'package:Minders/controllers/postController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(UserController());
    Get.put(DatabaseController());
    Get.put(PostController());
    Get.put(MainBarController());
  }
}
