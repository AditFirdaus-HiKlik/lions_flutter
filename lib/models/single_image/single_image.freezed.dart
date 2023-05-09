// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleImage _$SingleImageFromJson(Map<String, dynamic> json) {
  return _SingleImage.fromJson(json);
}

/// @nodoc
mixin _$SingleImage {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleImageCopyWith<SingleImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleImageCopyWith<$Res> {
  factory $SingleImageCopyWith(
          SingleImage value, $Res Function(SingleImage) then) =
      _$SingleImageCopyWithImpl<$Res, SingleImage>;
  @useResult
  $Res call({int id, String name, String url});
}

/// @nodoc
class _$SingleImageCopyWithImpl<$Res, $Val extends SingleImage>
    implements $SingleImageCopyWith<$Res> {
  _$SingleImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SingleImageCopyWith<$Res>
    implements $SingleImageCopyWith<$Res> {
  factory _$$_SingleImageCopyWith(
          _$_SingleImage value, $Res Function(_$_SingleImage) then) =
      __$$_SingleImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String url});
}

/// @nodoc
class __$$_SingleImageCopyWithImpl<$Res>
    extends _$SingleImageCopyWithImpl<$Res, _$_SingleImage>
    implements _$$_SingleImageCopyWith<$Res> {
  __$$_SingleImageCopyWithImpl(
      _$_SingleImage _value, $Res Function(_$_SingleImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_SingleImage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SingleImage with DiagnosticableTreeMixin implements _SingleImage {
  const _$_SingleImage({this.id = 0, this.name = "", this.url = ""});

  factory _$_SingleImage.fromJson(Map<String, dynamic> json) =>
      _$$_SingleImageFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleImage(id: $id, name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleImage'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleImageCopyWith<_$_SingleImage> get copyWith =>
      __$$_SingleImageCopyWithImpl<_$_SingleImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SingleImageToJson(
      this,
    );
  }
}

abstract class _SingleImage implements SingleImage {
  const factory _SingleImage(
      {final int id, final String name, final String url}) = _$_SingleImage;

  factory _SingleImage.fromJson(Map<String, dynamic> json) =
      _$_SingleImage.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_SingleImageCopyWith<_$_SingleImage> get copyWith =>
      throw _privateConstructorUsedError;
}
