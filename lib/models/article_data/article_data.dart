import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lions_flutter/models/single_image/single_image.dart';

part 'article_data.freezed.dart';
part 'article_data.g.dart';

@freezed
class ArticleData with _$ArticleData {
  const factory ArticleData({
    @Default("") String title,
    @Default("") String url,
    @Default("") String author,
    @Default(SingleImage()) SingleImage coverImage,
    @Default("") String body,
    @Default("") String citation,
  }) = _ArticleData;

  factory ArticleData.fromJson(Map<String, dynamic> json) => _$ArticleDataFromJson(json);
}
