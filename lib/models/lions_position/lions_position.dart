import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lions_position.freezed.dart';
part 'lions_position.g.dart';

@freezed
class LionsPosition with _$LionsPosition {
  const factory LionsPosition({
    @Default(0) int id,
    @Default("") String title,
  }) = _LionsPosition;

  factory LionsPosition.fromJson(Map<String, dynamic> json) =>
      _$LionsPositionFromJson(json);
}
