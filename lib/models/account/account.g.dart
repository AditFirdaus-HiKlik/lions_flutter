// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as int? ?? 0,
      memberID: json['memberID'] as String? ?? "",
      username: json['username'] as String? ?? "",
      email: json['email'] as String? ?? "",
      confirmed: json['confirmed'] as bool? ?? false,
      blocked: json['blocked'] as bool? ?? false,
      avatar: json['avatar'] == null
          ? const SingleImage()
          : SingleImage.fromJson(json['avatar'] as Map<String, dynamic>),
      name: json['name'] as String? ?? "",
      about: json['about'] as String? ?? "",
      address: json['address'] as String? ?? "",
      rank: json['rank'] == null
          ? const LionsRank()
          : LionsRank.fromJson(json['rank'] as Map<String, dynamic>),
      phone: json['phone'] as String? ?? "",
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
      socials: (json['socials'] as List<dynamic>?)
              ?.map((e) => MemberSocial.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MemberSocial()],
      trainings: (json['trainings'] as List<dynamic>?)
              ?.map((e) => MemberTraining.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MemberTraining()],
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberID': instance.memberID,
      'username': instance.username,
      'email': instance.email,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
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
      'socials': instance.socials,
      'trainings': instance.trainings,
    };
