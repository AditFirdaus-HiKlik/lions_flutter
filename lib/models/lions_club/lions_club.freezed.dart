// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lions_club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LionsClub _$LionsClubFromJson(Map<String, dynamic> json) {
  return _LionsClub.fromJson(json);
}

/// @nodoc
mixin _$LionsClub {
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LionsClubCopyWith<LionsClub> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LionsClubCopyWith<$Res> {
  factory $LionsClubCopyWith(LionsClub value, $Res Function(LionsClub) then) =
      _$LionsClubCopyWithImpl<$Res, LionsClub>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$LionsClubCopyWithImpl<$Res, $Val extends LionsClub>
    implements $LionsClubCopyWith<$Res> {
  _$LionsClubCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LionsClubCopyWith<$Res> implements $LionsClubCopyWith<$Res> {
  factory _$$_LionsClubCopyWith(
          _$_LionsClub value, $Res Function(_$_LionsClub) then) =
      __$$_LionsClubCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_LionsClubCopyWithImpl<$Res>
    extends _$LionsClubCopyWithImpl<$Res, _$_LionsClub>
    implements _$$_LionsClubCopyWith<$Res> {
  __$$_LionsClubCopyWithImpl(
      _$_LionsClub _value, $Res Function(_$_LionsClub) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_LionsClub(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LionsClub with DiagnosticableTreeMixin implements _LionsClub {
  const _$_LionsClub({this.title = ""});

  factory _$_LionsClub.fromJson(Map<String, dynamic> json) =>
      _$$_LionsClubFromJson(json);

  @override
  @JsonKey()
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LionsClub(title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LionsClub'))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LionsClub &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LionsClubCopyWith<_$_LionsClub> get copyWith =>
      __$$_LionsClubCopyWithImpl<_$_LionsClub>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LionsClubToJson(
      this,
    );
  }
}

abstract class _LionsClub implements LionsClub {
  const factory _LionsClub({final String title}) = _$_LionsClub;

  factory _LionsClub.fromJson(Map<String, dynamic> json) =
      _$_LionsClub.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_LionsClubCopyWith<_$_LionsClub> get copyWith =>
      throw _privateConstructorUsedError;
}
