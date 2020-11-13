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

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map['firstName'] = this.firstName;
    map['lastName'] = this.lastName;
    map['mobile'] = this.mobile;
    map['imageUrl'] = this.imageUrl;
    map['email'] = this.email;
    return map;
  }
}
