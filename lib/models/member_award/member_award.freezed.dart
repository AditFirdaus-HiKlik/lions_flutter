// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_award.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberAward _$MemberAwardFromJson(Map<String, dynamic> json) {
  return _MemberAward.fromJson(json);
}

/// @nodoc
mixin _$MemberAward {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberAwardCopyWith<MemberAward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberAwardCopyWith<$Res> {
  factory $MemberAwardCopyWith(
          MemberAward value, $Res Function(MemberAward) then) =
      _$MemberAwardCopyWithImpl<$Res, MemberAward>;
  @useResult
  $Res call({int id, String title, String description, String dateTime});
}

/// @nodoc
class _$MemberAwardCopyWithImpl<$Res, $Val extends MemberAward>
    implements $MemberAwardCopyWith<$Res> {
  _$MemberAwardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_MemberAwardCopyWith<$Res>
    implements $MemberAwardCopyWith<$Res> {
  factory _$$_MemberAwardCopyWith(
          _$_MemberAward value, $Res Function(_$_MemberAward) then) =
      __$$_MemberAwardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String description, String dateTime});
}

/// @nodoc
class __$$_MemberAwardCopyWithImpl<$Res>
    extends _$MemberAwardCopyWithImpl<$Res, _$_MemberAward>
    implements _$$_MemberAwardCopyWith<$Res> {
  __$$_MemberAwardCopyWithImpl(
      _$_MemberAward _value, $Res Function(_$_MemberAward) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? dateTime = null,
  }) {
    return _then(_$_MemberAward(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_MemberAward with DiagnosticableTreeMixin implements _MemberAward {
  const _$_MemberAward(
      {this.id = 0,
      this.title = "",
      this.description = "",
      this.dateTime = ""});

  factory _$_MemberAward.fromJson(Map<String, dynamic> json) =>
      _$$_MemberAwardFromJson(json);

  @override
  @JsonKey()
  final int id;
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
    return 'MemberAward(id: $id, title: $title, description: $description, dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberAward'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberAward &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberAwardCopyWith<_$_MemberAward> get copyWith =>
      __$$_MemberAwardCopyWithImpl<_$_MemberAward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberAwardToJson(
      this,
    );
  }
}

abstract class _MemberAward implements MemberAward {
  const factory _MemberAward(
      {final int id,
      final String title,
      final String description,
      final String dateTime}) = _$_MemberAward;

  factory _MemberAward.fromJson(Map<String, dynamic> json) =
      _$_MemberAward.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_MemberAwardCopyWith<_$_MemberAward> get copyWith =>
      throw _privateConstructorUsedError;
}
