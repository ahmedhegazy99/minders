import 'package:Minders/controllers/authController.dart';
import 'package:Minders/controllers/databaseController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<DatabaseController>(() => DatabaseController());
  }
}
