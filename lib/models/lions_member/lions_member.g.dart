// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lions_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LionsMember _$$_LionsMemberFromJson(Map<String, dynamic> json) =>
    _$_LionsMember(
      id: json['id'] as int? ?? 0,
      memberID: json['memberID'] as String? ?? "",
      username: json['username'] as String? ?? "",
      avatar: json['avatar'] == null
          ? const SingleImage()
          : SingleImage.fromJson(json['avatar'] as Map<String, dynamic>),
      name: json['name'] as String? ?? "",
      about: json['about'] as String? ?? "",
      address: json['address'] as String? ?? "",
      rank: json['rank'] == null
          ? const MemberRank()
          : MemberRank.fromJson(json['rank'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? const MemberSocial()
          : MemberSocial.fromJson(json['phone'] as Map<String, dynamic>),
      district: json['district'] == null
          ? const LionsDistrict()
          : LionsDistrict.fromJson(json['district'] as Map<String, dynamic>),
      club: json['club'] == null
          ? const LionsClub()
          : LionsClub.fromJson(json['club'] as Map<String, dynamic>),
      awards: (json['awards'] as List<dynamic>?)
              ?.map((e) => MemberAward.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MemberAward()],
      achivements: (json['achivements'] as List<dynamic>?)
              ?.map((e) => MemberAchivement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MemberAchivement()],
      social: (json['social'] as List<dynamic>?)
              ?.map((e) => MemberSocial.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MemberSocial()],
      trainings: (json['trainings'] as List<dynamic>?)
              ?.map((e) => MemberTraining.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MemberTraining()],
    );

Map<String, dynamic> _$$_LionsMemberToJson(_$_LionsMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberID': instance.memberID,
      'username': instance.username,
      'avatar': instance.avatar,
      'name': instance.name,
      'about': instance.about,
      'address': instance.address,
      'rank': instance.rank,
      'phone': instance.phone,
      'district': instance.district,
      'club': instance.club,
      'awards': instance.awards,
      'achivements': instance.achivements,
      'social': instance.social,
      'trainings': instance.trainings,
    };
