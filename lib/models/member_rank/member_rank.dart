import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_rank.freezed.dart';
part 'member_rank.g.dart';

@freezed
class MemberRank with _$MemberRank {
  const factory MemberRank({
    @Default(0) int id,
    @Default("") String name,
  }) = _MemberRank;

  factory MemberRank.fromJson(Map<String, dynamic> json) =>
      _$MemberRankFromJson(json);
}
