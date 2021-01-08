import 'dart:io';

import 'package:Minders/controllers/authController.dart';
import 'package:Minders/controllers/userController.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/models/replyModel.dart';
import 'package:Minders/models/userModel.dart';
import 'package:Minders/utils/utilFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final Firestore _firestore = Firestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var posts = RxList<PostModel>();
  var newPosts = Rx<QuerySnapshot>();
  var loading = false.obs;
  var uploading = false.obs;

  @override
  void onInit() {
    getPosts();
  }

  @override
  void onReady() {
    newPosts.bindStream(_firestore.collection('posts').snapshots());
    ever(newPosts, (newVal) {
      if (newVal.documents.length != posts.length) {
        getPosts(update: true);
      }
    });
  }

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .document(user.id)
          .setData(user.toJson());
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
      return UserModel.fromJson(doc.data);
    } catch (e) {
      Get.find<AuthController>().signOut();
      return Get.find<UserController>().user;
    }
  }

  Future<void> addPost(PostModel post, {File image}) async {
    try {
      uploading.toggle();
      if (image != null) {
        post.contentUrl = await uploadPostImage(post, image);
      }
      await _firestore
          .collection('posts')
          .add(post.toJson())
          .then((doc) => doc.updateData({"id": doc.documentID}));
      uploading.toggle();
    } catch (e) {
      uploading.toggle();
      displayError(e);
      return;
    }
  }

  Future<void> updatePost(PostModel post) async {
    try {
      await _firestore
          .collection('posts')
          .document(post.id)
          .updateData(post.toJson());
      return;
    } catch (e) {
      displayError(e);
      return;
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      bool delete = await Get.defaultDialog<bool>(
          title: 'warning'.tr,
          content: Text('confirmPostDelete'.tr),
          actions: [
            RaisedButton(
              onPressed: () => Get.back(result: true),
              child: Text('delete'.tr),
              color: Colors.red,
            ),
            RaisedButton(
              onPressed: () => Get.back(result: false),
              child: Text('cancel'.tr),
            )
          ]);
      if (delete) {
        _firestore.collection('posts').document(postId).delete();
      }
      return;
    } catch (e) {
      displayError(e);
      return;
    }
  }

  Stream<List<PostModel>> getPosts({bool update = false}) {
    return _firestore
        .collection('posts')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((doc) => PostModel.fromJson(doc.data))
            .toList());
  }

  Future<List<PostModel>> getUserPosts(String userId) async {
    try {
      QuerySnapshot postsDocs = await _firestore
          .collection('posts')
          .where('userId', isEqualTo: userId)
          .getDocuments();

      List<PostModel> posts = [];
      postsDocs.documents.forEach((element) {
        posts.add(PostModel.fromJson(element.data));
      });

      posts.sort((a, b) => b.date.compareTo(a.date));
      return posts;
    } catch (e) {
      displayError(e);
      return null;
    }
  }

  Future<String> addComment(ReplyModel comment) async {
    try {
      String id;
      await _firestore.collection('comments').add(comment.toJson()).then((doc) {
        id = doc.documentID;
        doc.updateData({"id": id});
      });
      return id;
    } catch (e) {
      displayError(e);
      return null;
    }
  }

  Stream<List<ReplyModel>> getComments({@required postId}) {
    return _firestore
        .collection('comments')
        .where('postId', isEqualTo: postId)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((doc) => ReplyModel.fromJson(doc.data))
            .toList());
  }

  Future<String> uploadPostImage(PostModel post, File image) async {
    try {
      String imageName = '${post.userName}_${post.date}.png';
      StorageReference reference = _storage.ref().child('posts/$imageName');
      StorageUploadTask uploadTask = reference.putFile(image);
      StorageTaskSnapshot snapshot = await uploadTask.onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      displayError(e);
      return null;
    }
  }
}
