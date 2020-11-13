import 'package:Minders/controllers/authController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Database _db;
Database get db {
  if (_db == null) {
    _db = Database();
  }
  return _db;
}

class Database {
  final Firestore _firestore = Firestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .document(user.id)
          .setData(user.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').document(uid).get();
      return UserModel.fromDoc(doc);
    } catch (e) {
      Get.find<AuthController>().signOut();
      return Get.find<UserController>().user;
    }
  }

  // Future<void> addTodo(String content, String uid) async {
  //   try {
  //     await _firestore
  //         .collection('users')
  //         .document(uid)
  //         .collection('todos')
  //         .add({
  //       'dateCreated': Timestamp.now(),
  //       'content': content,
  //       'done': false
  //     });
  //   } catch (e) {
  //     return;
  //   }
  // }

  // Stream<List<TodoModel>> getTodos(String uid) {
  //   return _firestore
  //       .collection('users')
  //       .document(uid)
  //       .collection('todos')
  //       .orderBy('dateCreated', descending: true)
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.documents.map((doc) => TodoModel.fromDoc(doc)).toList());
  // }

  // Future<void> changeTodoVal(bool newVal, String todoId, String uid) async {
  //   try {
  //     await _firestore
  //         .collection('users')
  //         .document(uid)
  //         .collection('todos')
  //         .document(todoId)
  //         .updateData({'done': newVal});
  //   } catch (e) {
  //     return;
  //   }
  // }

  // Future<void> deleteTodo(String todoId, String uid) async {
  //   try {
  //     await _firestore
  //         .collection('users')
  //         .document(uid)
  //         .collection('todos')
  //         .document(todoId)
  //         .delete();
  //   } catch (e) {
  //     return;
  //   }
  // }
}
