// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return _ArticleData.fromJson(json);
}

/// @nodoc
mixin _$ArticleData {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  SingleImage get coverImage => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get citation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleDataCopyWith<ArticleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDataCopyWith<$Res> {
  factory $ArticleDataCopyWith(
          ArticleData value, $Res Function(ArticleData) then) =
      _$ArticleDataCopyWithImpl<$Res, ArticleData>;
  @useResult
  $Res call(
      {String title,
      String url,
      String author,
      SingleImage coverImage,
      String body,
      String citation});

  $SingleImageCopyWith<$Res> get coverImage;
}

/// @nodoc
class _$ArticleDataCopyWithImpl<$Res, $Val extends ArticleData>
    implements $ArticleDataCopyWith<$Res> {
  _$ArticleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? author = null,
    Object? coverImage = null,
    Object? body = null,
    Object? citation = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as SingleImage,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      citation: null == citation
          ? _value.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SingleImageCopyWith<$Res> get coverImage {
    return $SingleImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArticleDataCopyWith<$Res>
    implements $ArticleDataCopyWith<$Res> {
  factory _$$_ArticleDataCopyWith(
          _$_ArticleData value, $Res Function(_$_ArticleData) then) =
      __$$_ArticleDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String url,
      String author,
      SingleImage coverImage,
      String body,
      String citation});

  @override
  $SingleImageCopyWith<$Res> get coverImage;
}

/// @nodoc
class __$$_ArticleDataCopyWithImpl<$Res>
    extends _$ArticleDataCopyWithImpl<$Res, _$_ArticleData>
    implements _$$_ArticleDataCopyWith<$Res> {
  __$$_ArticleDataCopyWithImpl(
      _$_ArticleData _value, $Res Function(_$_ArticleData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? author = null,
    Object? coverImage = null,
    Object? body = null,
    Object? citation = null,
  }) {
    return _then(_$_ArticleData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as SingleImage,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      citation: null == citation
          ? _value.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticleData with DiagnosticableTreeMixin implements _ArticleData {
  const _$_ArticleData(
      {this.title = "",
      this.url = "",
      this.author = "",
      this.coverImage = const SingleImage(),
      this.body = "",
      this.citation = ""});

  factory _$_ArticleData.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleDataFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String author;
  @override
  @JsonKey()
  final SingleImage coverImage;
  @override
  @JsonKey()
  final String body;
  @override
  @JsonKey()
  final String citation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticleData(title: $title, url: $url, author: $author, coverImage: $coverImage, body: $body, citation: $citation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticleData'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('coverImage', coverImage))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('citation', citation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.citation, citation) ||
                other.citation == citation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, author, coverImage, body, citation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleDataCopyWith<_$_ArticleData> get copyWith =>
      __$$_ArticleDataCopyWithImpl<_$_ArticleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleDataToJson(
      this,
    );
  }
}

abstract class _ArticleData implements ArticleData {
  const factory _ArticleData(
      {final String title,
      final String url,
      final String author,
      final SingleImage coverImage,
      final String body,
      final String citation}) = _$_ArticleData;

  factory _ArticleData.fromJson(Map<String, dynamic> json) =
      _$_ArticleData.fromJson;

  @override
  String get title;
  @override
  String get url;
  @override
  String get author;
  @override
  SingleImage get coverImage;
  @override
  String get body;
  @override
  String get citation;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleDataCopyWith<_$_ArticleData> get copyWith =>
      throw _privateConstructorUsedError;
}
