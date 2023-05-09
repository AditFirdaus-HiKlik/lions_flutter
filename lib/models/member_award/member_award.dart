import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_award.freezed.dart';
part 'member_award.g.dart';

@freezed
class MemberAward with _$MemberAward {
  const factory MemberAward({
    @Default("") String title,
    @Default("") String description,
    @Default("") String dateTime,
  }) = _MemberAward;

  factory MemberAward.fromJson(Map<String, dynamic> json) => _$MemberAwardFromJson(json);
}