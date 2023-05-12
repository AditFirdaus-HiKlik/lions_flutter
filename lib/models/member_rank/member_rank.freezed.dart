// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_rank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberRank _$MemberRankFromJson(Map<String, dynamic> json) {
  return _MemberRank.fromJson(json);
}

/// @nodoc
mixin _$MemberRank {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberRankCopyWith<MemberRank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberRankCopyWith<$Res> {
  factory $MemberRankCopyWith(
          MemberRank value, $Res Function(MemberRank) then) =
      _$MemberRankCopyWithImpl<$Res, MemberRank>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$MemberRankCopyWithImpl<$Res, $Val extends MemberRank>
    implements $MemberRankCopyWith<$Res> {
  _$MemberRankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberRankCopyWith<$Res>
    implements $MemberRankCopyWith<$Res> {
  factory _$$_MemberRankCopyWith(
          _$_MemberRank value, $Res Function(_$_MemberRank) then) =
      __$$_MemberRankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_MemberRankCopyWithImpl<$Res>
    extends _$MemberRankCopyWithImpl<$Res, _$_MemberRank>
    implements _$$_MemberRankCopyWith<$Res> {
  __$$_MemberRankCopyWithImpl(
      _$_MemberRank _value, $Res Function(_$_MemberRank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_MemberRank(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberRank with DiagnosticableTreeMixin implements _MemberRank {
  const _$_MemberRank({this.id = 0, this.name = ""});

  factory _$_MemberRank.fromJson(Map<String, dynamic> json) =>
      _$$_MemberRankFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberRank(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberRank'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberRank &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberRankCopyWith<_$_MemberRank> get copyWith =>
      __$$_MemberRankCopyWithImpl<_$_MemberRank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberRankToJson(
      this,
    );
  }
}

abstract class _MemberRank implements MemberRank {
  const factory _MemberRank({final int id, final String name}) = _$_MemberRank;

  factory _MemberRank.fromJson(Map<String, dynamic> json) =
      _$_MemberRank.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_MemberRankCopyWith<_$_MemberRank> get copyWith =>
      throw _privateConstructorUsedError;
}
