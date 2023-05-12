// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberAward _$$_MemberAwardFromJson(Map<String, dynamic> json) =>
    _$_MemberAward(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      dateTime: json['dateTime'] as String? ?? "",
    );

Map<String, dynamic> _$$_MemberAwardToJson(_$_MemberAward instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dateTime': instance.dateTime,
    };
