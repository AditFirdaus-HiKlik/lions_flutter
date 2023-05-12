// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lions_rank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LionsRank _$LionsRankFromJson(Map<String, dynamic> json) {
  return _LionsRank.fromJson(json);
}

/// @nodoc
mixin _$LionsRank {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LionsRankCopyWith<LionsRank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LionsRankCopyWith<$Res> {
  factory $LionsRankCopyWith(LionsRank value, $Res Function(LionsRank) then) =
      _$LionsRankCopyWithImpl<$Res, LionsRank>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$LionsRankCopyWithImpl<$Res, $Val extends LionsRank>
    implements $LionsRankCopyWith<$Res> {
  _$LionsRankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LionsRankCopyWith<$Res> implements $LionsRankCopyWith<$Res> {
  factory _$$_LionsRankCopyWith(
          _$_LionsRank value, $Res Function(_$_LionsRank) then) =
      __$$_LionsRankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$_LionsRankCopyWithImpl<$Res>
    extends _$LionsRankCopyWithImpl<$Res, _$_LionsRank>
    implements _$$_LionsRankCopyWith<$Res> {
  __$$_LionsRankCopyWithImpl(
      _$_LionsRank _value, $Res Function(_$_LionsRank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_LionsRank(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LionsRank with DiagnosticableTreeMixin implements _LionsRank {
  const _$_LionsRank({this.id = 0, this.title = ""});

  factory _$_LionsRank.fromJson(Map<String, dynamic> json) =>
      _$$_LionsRankFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LionsRank(id: $id, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LionsRank'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LionsRank &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LionsRankCopyWith<_$_LionsRank> get copyWith =>
      __$$_LionsRankCopyWithImpl<_$_LionsRank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LionsRankToJson(
      this,
    );
  }
}

abstract class _LionsRank implements LionsRank {
  const factory _LionsRank({final int id, final String title}) = _$_LionsRank;

  factory _LionsRank.fromJson(Map<String, dynamic> json) =
      _$_LionsRank.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_LionsRankCopyWith<_$_LionsRank> get copyWith =>
      throw _privateConstructorUsedError;
}
