// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberSocial _$$_MemberSocialFromJson(Map<String, dynamic> json) =>
    _$_MemberSocial(
      id: json['id'] as int? ?? 0,
      platform: json['platform'] as String? ?? "",
      value: json['value'] as String? ?? "",
      visible: json['visible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MemberSocialToJson(_$_MemberSocial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'value': instance.value,
      'visible': instance.visible,
    };
