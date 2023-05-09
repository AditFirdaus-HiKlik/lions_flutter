// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleData _$$_ArticleDataFromJson(Map<String, dynamic> json) =>
    _$_ArticleData(
      title: json['title'] as String? ?? "",
      url: json['url'] as String? ?? "",
      author: json['author'] as String? ?? "",
      coverImage: json['coverImage'] == null
          ? const SingleImage()
          : SingleImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      body: json['body'] as String? ?? "",
      citation: json['citation'] as String? ?? "",
    );

Map<String, dynamic> _$$_ArticleDataToJson(_$_ArticleData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'author': instance.author,
      'coverImage': instance.coverImage,
      'body': instance.body,
      'citation': instance.citation,
    };
