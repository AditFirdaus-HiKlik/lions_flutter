// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lions_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LionsPosition _$LionsPositionFromJson(Map<String, dynamic> json) {
  return _LionsPosition.fromJson(json);
}

/// @nodoc
mixin _$LionsPosition {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LionsPositionCopyWith<LionsPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LionsPositionCopyWith<$Res> {
  factory $LionsPositionCopyWith(
          LionsPosition value, $Res Function(LionsPosition) then) =
      _$LionsPositionCopyWithImpl<$Res, LionsPosition>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$LionsPositionCopyWithImpl<$Res, $Val extends LionsPosition>
    implements $LionsPositionCopyWith<$Res> {
  _$LionsPositionCopyWithImpl(this._value, this._then);

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
abstract class _$$_LionsPositionCopyWith<$Res>
    implements $LionsPositionCopyWith<$Res> {
  factory _$$_LionsPositionCopyWith(
          _$_LionsPosition value, $Res Function(_$_LionsPosition) then) =
      __$$_LionsPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$_LionsPositionCopyWithImpl<$Res>
    extends _$LionsPositionCopyWithImpl<$Res, _$_LionsPosition>
    implements _$$_LionsPositionCopyWith<$Res> {
  __$$_LionsPositionCopyWithImpl(
      _$_LionsPosition _value, $Res Function(_$_LionsPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_LionsPosition(
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
class _$_LionsPosition with DiagnosticableTreeMixin implements _LionsPosition {
  const _$_LionsPosition({this.id = 0, this.title = ""});

  factory _$_LionsPosition.fromJson(Map<String, dynamic> json) =>
      _$$_LionsPositionFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LionsPosition(id: $id, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LionsPosition'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LionsPosition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LionsPositionCopyWith<_$_LionsPosition> get copyWith =>
      __$$_LionsPositionCopyWithImpl<_$_LionsPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LionsPositionToJson(
      this,
    );
  }
}

abstract class _LionsPosition implements LionsPosition {
  const factory _LionsPosition({final int id, final String title}) =
      _$_LionsPosition;

  factory _LionsPosition.fromJson(Map<String, dynamic> json) =
      _$_LionsPosition.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_LionsPositionCopyWith<_$_LionsPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
