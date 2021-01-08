import 'package:Minders/models/replyModel.dart';
import 'package:Minders/utils/utilFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'postModel.g.dart';

@JsonSerializable(explicitToJson: true)
class PostModel {
  String id;
  String userId;
  String userName;
  String userImage;
  @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  DateTime date;
  String text;
  PostTypeEnum type;
  String contentUrl;
  List<String> upvotes;

  PostModel({
    this.contentUrl,
    this.date,
    this.text,
    this.type,
    this.userId,
    this.userImage,
    this.userName,
    this.id,
    this.upvotes,
  });

  PostModel copy() => PostModel.fromJson(this.toJson());
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

enum PostTypeEnum { photo, text }
