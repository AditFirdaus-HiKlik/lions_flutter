// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventData _$EventDataFromJson(Map<String, dynamic> json) {
  return _EventData.fromJson(json);
}

/// @nodoc
mixin _$EventData {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  SingleImage get coverImage => throw _privateConstructorUsedError;
  String get organizingClub => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get picContact => throw _privateConstructorUsedError;
  String get donationAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventDataCopyWith<EventData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDataCopyWith<$Res> {
  factory $EventDataCopyWith(EventData value, $Res Function(EventData) then) =
      _$EventDataCopyWithImpl<$Res, EventData>;
  @useResult
  $Res call(
      {int id,
      String title,
      SingleImage coverImage,
      String organizingClub,
      String dateTime,
      String location,
      String picContact,
      String donationAccount});

  $SingleImageCopyWith<$Res> get coverImage;
}

/// @nodoc
class _$EventDataCopyWithImpl<$Res, $Val extends EventData>
    implements $EventDataCopyWith<$Res> {
  _$EventDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? coverImage = null,
    Object? organizingClub = null,
    Object? dateTime = null,
    Object? location = null,
    Object? picContact = null,
    Object? donationAccount = null,
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
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as SingleImage,
      organizingClub: null == organizingClub
          ? _value.organizingClub
          : organizingClub // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      picContact: null == picContact
          ? _value.picContact
          : picContact // ignore: cast_nullable_to_non_nullable
              as String,
      donationAccount: null == donationAccount
          ? _value.donationAccount
          : donationAccount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SingleImageCopyWith<$Res> get coverImage {
    return $SingleImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventDataCopyWith<$Res> implements $EventDataCopyWith<$Res> {
  factory _$$_EventDataCopyWith(
          _$_EventData value, $Res Function(_$_EventData) then) =
      __$$_EventDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      SingleImage coverImage,
      String organizingClub,
      String dateTime,
      String location,
      String picContact,
      String donationAccount});

  @override
  $SingleImageCopyWith<$Res> get coverImage;
}

/// @nodoc
class __$$_EventDataCopyWithImpl<$Res>
    extends _$EventDataCopyWithImpl<$Res, _$_EventData>
    implements _$$_EventDataCopyWith<$Res> {
  __$$_EventDataCopyWithImpl(
      _$_EventData _value, $Res Function(_$_EventData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? coverImage = null,
    Object? organizingClub = null,
    Object? dateTime = null,
    Object? location = null,
    Object? picContact = null,
    Object? donationAccount = null,
  }) {
    return _then(_$_EventData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as SingleImage,
      organizingClub: null == organizingClub
          ? _value.organizingClub
          : organizingClub // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      picContact: null == picContact
          ? _value.picContact
          : picContact // ignore: cast_nullable_to_non_nullable
              as String,
      donationAccount: null == donationAccount
          ? _value.donationAccount
          : donationAccount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventData with DiagnosticableTreeMixin implements _EventData {
  const _$_EventData(
      {this.id = 0,
      this.title = "",
      this.coverImage = const SingleImage(),
      this.organizingClub = "",
      this.dateTime = "",
      this.location = "",
      this.picContact = "",
      this.donationAccount = ""});

  factory _$_EventData.fromJson(Map<String, dynamic> json) =>
      _$$_EventDataFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final SingleImage coverImage;
  @override
  @JsonKey()
  final String organizingClub;
  @override
  @JsonKey()
  final String dateTime;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String picContact;
  @override
  @JsonKey()
  final String donationAccount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventData(id: $id, title: $title, coverImage: $coverImage, organizingClub: $organizingClub, dateTime: $dateTime, location: $location, picContact: $picContact, donationAccount: $donationAccount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('coverImage', coverImage))
      ..add(DiagnosticsProperty('organizingClub', organizingClub))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('picContact', picContact))
      ..add(DiagnosticsProperty('donationAccount', donationAccount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.organizingClub, organizingClub) ||
                other.organizingClub == organizingClub) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.picContact, picContact) ||
                other.picContact == picContact) &&
            (identical(other.donationAccount, donationAccount) ||
                other.donationAccount == donationAccount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, coverImage,
      organizingClub, dateTime, location, picContact, donationAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventDataCopyWith<_$_EventData> get copyWith =>
      __$$_EventDataCopyWithImpl<_$_EventData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventDataToJson(
      this,
    );
  }
}

abstract class _EventData implements EventData {
  const factory _EventData(
      {final int id,
      final String title,
      final SingleImage coverImage,
      final String organizingClub,
      final String dateTime,
      final String location,
      final String picContact,
      final String donationAccount}) = _$_EventData;

  factory _EventData.fromJson(Map<String, dynamic> json) =
      _$_EventData.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  SingleImage get coverImage;
  @override
  String get organizingClub;
  @override
  String get dateTime;
  @override
  String get location;
  @override
  String get picContact;
  @override
  String get donationAccount;
  @override
  @JsonKey(ignore: true)
  _$$_EventDataCopyWith<_$_EventData> get copyWith =>
      throw _privateConstructorUsedError;
}
