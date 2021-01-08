import 'package:json_annotation/json_annotation.dart';
part 'userModel.g.dart';

@JsonSerializable(explicitToJson: true)
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

  UserModel copy() => UserModel.fromJson(this.toJson());
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
