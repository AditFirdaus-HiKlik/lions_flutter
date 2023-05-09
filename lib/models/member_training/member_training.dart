import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_training.freezed.dart';
part 'member_training.g.dart';

@freezed
class MemberTraining with _$MemberTraining {
  const factory MemberTraining({
    @Default("") String title,
    @Default("") String description,
    @Default("") String trainingType,
    @Default("") String startDate,
    @Default("") String endDate,
  }) = _MemberTraining;

  factory MemberTraining.fromJson(Map<String, dynamic> json) => _$MemberTrainingFromJson(json);
}
