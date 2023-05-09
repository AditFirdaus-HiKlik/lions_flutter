// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_achivement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberAchivement _$MemberAchivementFromJson(Map<String, dynamic> json) {
  return _MemberAchivement.fromJson(json);
}

/// @nodoc
mixin _$MemberAchivement {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberAchivementCopyWith<MemberAchivement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberAchivementCopyWith<$Res> {
  factory $MemberAchivementCopyWith(
          MemberAchivement value, $Res Function(MemberAchivement) then) =
      _$MemberAchivementCopyWithImpl<$Res, MemberAchivement>;
  @useResult
  $Res call({String title, String description, String dateTime});
}

/// @nodoc
class _$MemberAchivementCopyWithImpl<$Res, $Val extends MemberAchivement>
    implements $MemberAchivementCopyWith<$Res> {
  _$MemberAchivementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberAchivementCopyWith<$Res>
    implements $MemberAchivementCopyWith<$Res> {
  factory _$$_MemberAchivementCopyWith(
          _$_MemberAchivement value, $Res Function(_$_MemberAchivement) then) =
      __$$_MemberAchivementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String dateTime});
}

/// @nodoc
class __$$_MemberAchivementCopyWithImpl<$Res>
    extends _$MemberAchivementCopyWithImpl<$Res, _$_MemberAchivement>
    implements _$$_MemberAchivementCopyWith<$Res> {
  __$$_MemberAchivementCopyWithImpl(
      _$_MemberAchivement _value, $Res Function(_$_MemberAchivement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? dateTime = null,
  }) {
    return _then(_$_MemberAchivement(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberAchivement
    with DiagnosticableTreeMixin
    implements _MemberAchivement {
  const _$_MemberAchivement(
      {this.title = "", this.description = "", this.dateTime = ""});

  factory _$_MemberAchivement.fromJson(Map<String, dynamic> json) =>
      _$$_MemberAchivementFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberAchivement(title: $title, description: $description, dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberAchivement'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberAchivement &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberAchivementCopyWith<_$_MemberAchivement> get copyWith =>
      __$$_MemberAchivementCopyWithImpl<_$_MemberAchivement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberAchivementToJson(
      this,
    );
  }
}

abstract class _MemberAchivement implements MemberAchivement {
  const factory _MemberAchivement(
      {final String title,
      final String description,
      final String dateTime}) = _$_MemberAchivement;

  factory _MemberAchivement.fromJson(Map<String, dynamic> json) =
      _$_MemberAchivement.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_MemberAchivementCopyWith<_$_MemberAchivement> get copyWith =>
      throw _privateConstructorUsedError;
}
