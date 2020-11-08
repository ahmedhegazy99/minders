import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  final String postId;
  DatabaseService({this.uid, this.postId});

  //collection reference
  final CollectionReference users = Firestore.instance.collection('users');

  Future<void> addUser(String firstName, String lastName, String mail, String mobile, String password) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'firstName': "add"+firstName,
      'lastName': lastName,
      'mail': mail,
      'mobile': mobile,
      'password': password,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  Future updateUserData(String firstName, String lastName, String mail, String mobile, String password) async {

    return await users.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'mail': mail,
      'mobile': mobile,
      'password': password,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  final CollectionReference postsCollection = Firestore.instance.collection('posts');

  Future uploadPosts({Future ownerId, /*String postId, String date,*/ String postText, String postPic, int likes, String replies}) async {

    return await postsCollection.add({

      'ownerId': ownerId,
      //'postId': postId,
      'date': Timestamp,
      'posText': postText,
      'postPic': postPic,
      'likes': likes,
      'replies': replies,

    })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }
}