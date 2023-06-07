// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) {
  return _ApiException.fromJson(json);
}

/// @nodoc
mixin _$ApiException {
  int get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiExceptionCopyWith<ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
          ApiException value, $Res Function(ApiException) then) =
      _$ApiExceptionCopyWithImpl<$Res, ApiException>;
  @useResult
  $Res call({int status, String name, String message});
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res, $Val extends ApiException>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiExceptionCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$_ApiExceptionCopyWith(
          _$_ApiException value, $Res Function(_$_ApiException) then) =
      __$$_ApiExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String name, String message});
}

/// @nodoc
class __$$_ApiExceptionCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$_ApiException>
    implements _$$_ApiExceptionCopyWith<$Res> {
  __$$_ApiExceptionCopyWithImpl(
      _$_ApiException _value, $Res Function(_$_ApiException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_$_ApiException(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiException implements _ApiException {
  const _$_ApiException({this.status = 0, this.name = '', this.message = ''});

  factory _$_ApiException.fromJson(Map<String, dynamic> json) =>
      _$$_ApiExceptionFromJson(json);

  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ApiException(status: $status, name: $name, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiException &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, name, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiExceptionCopyWith<_$_ApiException> get copyWith =>
      __$$_ApiExceptionCopyWithImpl<_$_ApiException>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiExceptionToJson(
      this,
    );
  }
}

abstract class _ApiException implements ApiException {
  const factory _ApiException(
      {final int status,
      final String name,
      final String message}) = _$_ApiException;

  factory _ApiException.fromJson(Map<String, dynamic> json) =
      _$_ApiException.fromJson;

  @override
  int get status;
  @override
  String get name;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ApiExceptionCopyWith<_$_ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}
