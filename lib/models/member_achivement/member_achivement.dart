import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_achivement.freezed.dart';
part 'member_achivement.g.dart';

@freezed
class MemberAchivement with _$MemberAchivement {
  const factory MemberAchivement({
    @Default("") String title,
    @Default("") String description,
    @Default("") String dateTime,
  }) = _MemberAchivement;

  factory MemberAchivement.fromJson(Map<String, dynamic> json) => _$MemberAchivementFromJson(json);
}