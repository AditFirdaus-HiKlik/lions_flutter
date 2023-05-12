// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationData _$$_LocationDataFromJson(Map<String, dynamic> json) =>
    _$_LocationData(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      address: json['address'] as String? ?? "",
      contactName: json['contactName'] as String? ?? "",
      contactNumber: json['contactNumber'] as String? ?? "",
      link: json['link'] as String? ?? "",
    );

Map<String, dynamic> _$$_LocationDataToJson(_$_LocationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'contactName': instance.contactName,
      'contactNumber': instance.contactNumber,
      'link': instance.link,
    };
