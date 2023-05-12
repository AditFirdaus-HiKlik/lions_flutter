import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lions_district.freezed.dart';
part 'lions_district.g.dart';

@freezed
class LionsDistrict with _$LionsDistrict {
  const factory LionsDistrict({
    @Default(0) int id,
    @Default("") String title,
  }) = _LionsDistrict;

  factory LionsDistrict.fromJson(Map<String, dynamic> json) =>
      _$LionsDistrictFromJson(json);
}
