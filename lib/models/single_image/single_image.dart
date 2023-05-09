import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_image.freezed.dart';
part 'single_image.g.dart';

@freezed
class SingleImage with _$SingleImage {
  const factory SingleImage({
    @Default(0) int id,
    @Default("") String name,
    @Default("") String url,
  }) = _SingleImage;

  factory SingleImage.fromJson(Map<String, dynamic> json) => _$SingleImageFromJson(json);
}