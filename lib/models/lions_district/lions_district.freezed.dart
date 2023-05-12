// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lions_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LionsDistrict _$LionsDistrictFromJson(Map<String, dynamic> json) {
  return _LionsDistrict.fromJson(json);
}

/// @nodoc
mixin _$LionsDistrict {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LionsDistrictCopyWith<LionsDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LionsDistrictCopyWith<$Res> {
  factory $LionsDistrictCopyWith(
          LionsDistrict value, $Res Function(LionsDistrict) then) =
      _$LionsDistrictCopyWithImpl<$Res, LionsDistrict>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$LionsDistrictCopyWithImpl<$Res, $Val extends LionsDistrict>
    implements $LionsDistrictCopyWith<$Res> {
  _$LionsDistrictCopyWithImpl(this._value, this._then);

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
abstract class _$$_LionsDistrictCopyWith<$Res>
    implements $LionsDistrictCopyWith<$Res> {
  factory _$$_LionsDistrictCopyWith(
          _$_LionsDistrict value, $Res Function(_$_LionsDistrict) then) =
      __$$_LionsDistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$_LionsDistrictCopyWithImpl<$Res>
    extends _$LionsDistrictCopyWithImpl<$Res, _$_LionsDistrict>
    implements _$$_LionsDistrictCopyWith<$Res> {
  __$$_LionsDistrictCopyWithImpl(
      _$_LionsDistrict _value, $Res Function(_$_LionsDistrict) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_LionsDistrict(
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
class _$_LionsDistrict with DiagnosticableTreeMixin implements _LionsDistrict {
  const _$_LionsDistrict({this.id = 0, this.title = ""});

  factory _$_LionsDistrict.fromJson(Map<String, dynamic> json) =>
      _$$_LionsDistrictFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LionsDistrict(id: $id, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LionsDistrict'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LionsDistrict &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LionsDistrictCopyWith<_$_LionsDistrict> get copyWith =>
      __$$_LionsDistrictCopyWithImpl<_$_LionsDistrict>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LionsDistrictToJson(
      this,
    );
  }
}

abstract class _LionsDistrict implements LionsDistrict {
  const factory _LionsDistrict({final int id, final String title}) =
      _$_LionsDistrict;

  factory _LionsDistrict.fromJson(Map<String, dynamic> json) =
      _$_LionsDistrict.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_LionsDistrictCopyWith<_$_LionsDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}
