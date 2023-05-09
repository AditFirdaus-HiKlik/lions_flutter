// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_social.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberSocial _$MemberSocialFromJson(Map<String, dynamic> json) {
  return _MemberSocial.fromJson(json);
}

/// @nodoc
mixin _$MemberSocial {
  String get platform => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberSocialCopyWith<MemberSocial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberSocialCopyWith<$Res> {
  factory $MemberSocialCopyWith(
          MemberSocial value, $Res Function(MemberSocial) then) =
      _$MemberSocialCopyWithImpl<$Res, MemberSocial>;
  @useResult
  $Res call({String platform, String user, bool visible});
}

/// @nodoc
class _$MemberSocialCopyWithImpl<$Res, $Val extends MemberSocial>
    implements $MemberSocialCopyWith<$Res> {
  _$MemberSocialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? user = null,
    Object? visible = null,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberSocialCopyWith<$Res>
    implements $MemberSocialCopyWith<$Res> {
  factory _$$_MemberSocialCopyWith(
          _$_MemberSocial value, $Res Function(_$_MemberSocial) then) =
      __$$_MemberSocialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String platform, String user, bool visible});
}

/// @nodoc
class __$$_MemberSocialCopyWithImpl<$Res>
    extends _$MemberSocialCopyWithImpl<$Res, _$_MemberSocial>
    implements _$$_MemberSocialCopyWith<$Res> {
  __$$_MemberSocialCopyWithImpl(
      _$_MemberSocial _value, $Res Function(_$_MemberSocial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? user = null,
    Object? visible = null,
  }) {
    return _then(_$_MemberSocial(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberSocial with DiagnosticableTreeMixin implements _MemberSocial {
  const _$_MemberSocial(
      {this.platform = "", this.user = "", this.visible = false});

  factory _$_MemberSocial.fromJson(Map<String, dynamic> json) =>
      _$$_MemberSocialFromJson(json);

  @override
  @JsonKey()
  final String platform;
  @override
  @JsonKey()
  final String user;
  @override
  @JsonKey()
  final bool visible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberSocial(platform: $platform, user: $user, visible: $visible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberSocial'))
      ..add(DiagnosticsProperty('platform', platform))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('visible', visible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberSocial &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.visible, visible) || other.visible == visible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platform, user, visible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberSocialCopyWith<_$_MemberSocial> get copyWith =>
      __$$_MemberSocialCopyWithImpl<_$_MemberSocial>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberSocialToJson(
      this,
    );
  }
}

abstract class _MemberSocial implements MemberSocial {
  const factory _MemberSocial(
      {final String platform,
      final String user,
      final bool visible}) = _$_MemberSocial;

  factory _MemberSocial.fromJson(Map<String, dynamic> json) =
      _$_MemberSocial.fromJson;

  @override
  String get platform;
  @override
  String get user;
  @override
  bool get visible;
  @override
  @JsonKey(ignore: true)
  _$$_MemberSocialCopyWith<_$_MemberSocial> get copyWith =>
      throw _privateConstructorUsedError;
}
