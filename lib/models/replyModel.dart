import 'package:Minders/utils/utilFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replyModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ReplyModel {
  String id;
  String userId;
  String userName;
  String userImage;
  String content;
  @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  DateTime date;

  ReplyModel(
      {this.id, this.content, this.userId, this.userImage, this.userName});

  ReplyModel copy() => ReplyModel.fromJson(this.toJson());
  factory ReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyModelToJson(this);
}
