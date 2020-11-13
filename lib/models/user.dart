import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String mobile;
  String imageUrl;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.imageUrl,
      this.email});

  UserModel.fromDoc(DocumentSnapshot doc) {
    this.id = doc.documentID;
    this.firstName = doc['firstName'];
    this.lastName = doc['lastName'];
    this.mobile = doc['mobile'];
    this.imageUrl = doc['imageUrl'];
    this.email = doc['email'];
  }

  Map toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'imageUrl': imageUrl,
    };
  }
}
