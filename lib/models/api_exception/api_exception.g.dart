// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiException _$$_ApiExceptionFromJson(Map<String, dynamic> json) =>
    _$_ApiException(
      status: json['status'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_ApiExceptionToJson(_$_ApiException instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'message': instance.message,
    };
