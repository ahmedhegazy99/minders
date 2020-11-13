// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyModel _$ReplyModelFromJson(Map<String, dynamic> json) {
  return ReplyModel(
    id: json['id'] as String,
    content: json['content'] as String,
    userId: json['userId'] as String,
    userImage: json['userImage'] as String,
    userName: json['userName'] as String,
  )..date = dateTimeFromTimestamp(json['date'] as Timestamp);
}

Map<String, dynamic> _$ReplyModelToJson(ReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'content': instance.content,
      'date': dateTimeToTimestamp(instance.date),
    };
