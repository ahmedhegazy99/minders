// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    contentUrl: json['contentUrl'] as String,
    date: dateTimeFromTimestamp(json['date'] as Timestamp),
    text: json['text'] as String,
    type: _$enumDecodeNullable(_$PostTypeEnumEnumMap, json['type']),
    userId: json['userId'] as String,
    userImage: json['userImage'] as String,
    userName: json['userName'] as String,
    id: json['id'] as String,
    replies: (json['replies'] as List)
        ?.map((e) =>
            e == null ? null : ReplyModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    upvotes: (json['upvotes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'date': dateTimeToTimestamp(instance.date),
      'text': instance.text,
      'type': _$PostTypeEnumEnumMap[instance.type],
      'contentUrl': instance.contentUrl,
      'replies': instance.replies?.map((e) => e?.toJson())?.toList(),
      'upvotes': instance.upvotes,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PostTypeEnumEnumMap = {
  PostTypeEnum.photo: 'photo',
  PostTypeEnum.text: 'text',
};
