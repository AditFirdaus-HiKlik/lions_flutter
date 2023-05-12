// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberTraining _$$_MemberTrainingFromJson(Map<String, dynamic> json) =>
    _$_MemberTraining(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      trainingType: json['trainingType'] as String? ?? "",
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
    );

Map<String, dynamic> _$$_MemberTrainingToJson(_$_MemberTraining instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'trainingType': instance.trainingType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
