import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lions_club.freezed.dart';
part 'lions_club.g.dart';

@freezed
class LionsClub with _$LionsClub {
  const factory LionsClub({
    @Default("") String title,
  }) = _LionsClub;

  factory LionsClub.fromJson(Map<String, dynamic> json) => _$LionsClubFromJson(json);
}