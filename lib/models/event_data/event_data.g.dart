// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventData _$$_EventDataFromJson(Map<String, dynamic> json) => _$_EventData(
      title: json['title'] as String? ?? "",
      coverImage: json['coverImage'] == null
          ? const SingleImage()
          : SingleImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      organizingClub: json['organizingClub'] as String? ?? "",
      dateTime: json['dateTime'] as String? ?? "",
      location: json['location'] as String? ?? "",
      picContact: json['picContact'] as String? ?? "",
      donationAccount: json['donationAccount'] as String? ?? "",
    );

Map<String, dynamic> _$$_EventDataToJson(_$_EventData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'coverImage': instance.coverImage,
      'organizingClub': instance.organizingClub,
      'dateTime': instance.dateTime,
      'location': instance.location,
      'picContact': instance.picContact,
      'donationAccount': instance.donationAccount,
    };
