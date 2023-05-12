// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_training.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberTraining _$MemberTrainingFromJson(Map<String, dynamic> json) {
  return _MemberTraining.fromJson(json);
}

/// @nodoc
mixin _$MemberTraining {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get trainingType => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberTrainingCopyWith<MemberTraining> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberTrainingCopyWith<$Res> {
  factory $MemberTrainingCopyWith(
          MemberTraining value, $Res Function(MemberTraining) then) =
      _$MemberTrainingCopyWithImpl<$Res, MemberTraining>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String trainingType,
      String startDate,
      String endDate});
}

/// @nodoc
class _$MemberTrainingCopyWithImpl<$Res, $Val extends MemberTraining>
    implements $MemberTrainingCopyWith<$Res> {
  _$MemberTrainingCopyWithImpl(this._value, this._then);

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
    Object? trainingType = null,
    Object? startDate = null,
    Object? endDate = null,
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
      trainingType: null == trainingType
          ? _value.trainingType
          : trainingType // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberTrainingCopyWith<$Res>
    implements $MemberTrainingCopyWith<$Res> {
  factory _$$_MemberTrainingCopyWith(
          _$_MemberTraining value, $Res Function(_$_MemberTraining) then) =
      __$$_MemberTrainingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String trainingType,
      String startDate,
      String endDate});
}

/// @nodoc
class __$$_MemberTrainingCopyWithImpl<$Res>
    extends _$MemberTrainingCopyWithImpl<$Res, _$_MemberTraining>
    implements _$$_MemberTrainingCopyWith<$Res> {
  __$$_MemberTrainingCopyWithImpl(
      _$_MemberTraining _value, $Res Function(_$_MemberTraining) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? trainingType = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$_MemberTraining(
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
      trainingType: null == trainingType
          ? _value.trainingType
          : trainingType // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberTraining
    with DiagnosticableTreeMixin
    implements _MemberTraining {
  const _$_MemberTraining(
      {this.id = 0,
      this.title = "",
      this.description = "",
      this.trainingType = "",
      this.startDate = "",
      this.endDate = ""});

  factory _$_MemberTraining.fromJson(Map<String, dynamic> json) =>
      _$$_MemberTrainingFromJson(json);

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
  final String trainingType;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberTraining(id: $id, title: $title, description: $description, trainingType: $trainingType, startDate: $startDate, endDate: $endDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberTraining'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('trainingType', trainingType))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberTraining &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.trainingType, trainingType) ||
                other.trainingType == trainingType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, trainingType, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberTrainingCopyWith<_$_MemberTraining> get copyWith =>
      __$$_MemberTrainingCopyWithImpl<_$_MemberTraining>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberTrainingToJson(
      this,
    );
  }
}

abstract class _MemberTraining implements MemberTraining {
  const factory _MemberTraining(
      {final int id,
      final String title,
      final String description,
      final String trainingType,
      final String startDate,
      final String endDate}) = _$_MemberTraining;

  factory _MemberTraining.fromJson(Map<String, dynamic> json) =
      _$_MemberTraining.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get trainingType;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_MemberTrainingCopyWith<_$_MemberTraining> get copyWith =>
      throw _privateConstructorUsedError;
}
