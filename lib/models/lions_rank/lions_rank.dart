import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lions_rank.freezed.dart';
part 'lions_rank.g.dart';

@freezed
class LionsRank with _$LionsRank {
  const factory LionsRank({
    @Default(0) int id,
    @Default("") String title,
  }) = _LionsRank;

  factory LionsRank.fromJson(Map<String, dynamic> json) =>
      _$LionsRankFromJson(json);
}
