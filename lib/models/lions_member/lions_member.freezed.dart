// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lions_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LionsMember _$LionsMemberFromJson(Map<String, dynamic> json) {
  return _LionsMember.fromJson(json);
}

/// @nodoc
mixin _$LionsMember {
  String get username => throw _privateConstructorUsedError;
  SingleImage get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  LionsDistrict get district => throw _privateConstructorUsedError;
  LionsClub get club => throw _privateConstructorUsedError;
  List<MemberAward> get awards => throw _privateConstructorUsedError;
  List<MemberAchivement> get achivements => throw _privateConstructorUsedError;
  List<MemberSocial> get social => throw _privateConstructorUsedError;
  List<MemberTraining> get trainings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LionsMemberCopyWith<LionsMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LionsMemberCopyWith<$Res> {
  factory $LionsMemberCopyWith(
          LionsMember value, $Res Function(LionsMember) then) =
      _$LionsMemberCopyWithImpl<$Res, LionsMember>;
  @useResult
  $Res call(
      {String username,
      SingleImage avatar,
      String name,
      String about,
      String address,
      String phone,
      LionsDistrict district,
      LionsClub club,
      List<MemberAward> awards,
      List<MemberAchivement> achivements,
      List<MemberSocial> social,
      List<MemberTraining> trainings});

  $SingleImageCopyWith<$Res> get avatar;
  $LionsDistrictCopyWith<$Res> get district;
  $LionsClubCopyWith<$Res> get club;
}

/// @nodoc
class _$LionsMemberCopyWithImpl<$Res, $Val extends LionsMember>
    implements $LionsMemberCopyWith<$Res> {
  _$LionsMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? avatar = null,
    Object? name = null,
    Object? about = null,
    Object? address = null,
    Object? phone = null,
    Object? district = null,
    Object? club = null,
    Object? awards = null,
    Object? achivements = null,
    Object? social = null,
    Object? trainings = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as SingleImage,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as LionsDistrict,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as LionsClub,
      awards: null == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<MemberAward>,
      achivements: null == achivements
          ? _value.achivements
          : achivements // ignore: cast_nullable_to_non_nullable
              as List<MemberAchivement>,
      social: null == social
          ? _value.social
          : social // ignore: cast_nullable_to_non_nullable
              as List<MemberSocial>,
      trainings: null == trainings
          ? _value.trainings
          : trainings // ignore: cast_nullable_to_non_nullable
              as List<MemberTraining>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SingleImageCopyWith<$Res> get avatar {
    return $SingleImageCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LionsDistrictCopyWith<$Res> get district {
    return $LionsDistrictCopyWith<$Res>(_value.district, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LionsClubCopyWith<$Res> get club {
    return $LionsClubCopyWith<$Res>(_value.club, (value) {
      return _then(_value.copyWith(club: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LionsMemberCopyWith<$Res>
    implements $LionsMemberCopyWith<$Res> {
  factory _$$_LionsMemberCopyWith(
          _$_LionsMember value, $Res Function(_$_LionsMember) then) =
      __$$_LionsMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      SingleImage avatar,
      String name,
      String about,
      String address,
      String phone,
      LionsDistrict district,
      LionsClub club,
      List<MemberAward> awards,
      List<MemberAchivement> achivements,
      List<MemberSocial> social,
      List<MemberTraining> trainings});

  @override
  $SingleImageCopyWith<$Res> get avatar;
  @override
  $LionsDistrictCopyWith<$Res> get district;
  @override
  $LionsClubCopyWith<$Res> get club;
}

/// @nodoc
class __$$_LionsMemberCopyWithImpl<$Res>
    extends _$LionsMemberCopyWithImpl<$Res, _$_LionsMember>
    implements _$$_LionsMemberCopyWith<$Res> {
  __$$_LionsMemberCopyWithImpl(
      _$_LionsMember _value, $Res Function(_$_LionsMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? avatar = null,
    Object? name = null,
    Object? about = null,
    Object? address = null,
    Object? phone = null,
    Object? district = null,
    Object? club = null,
    Object? awards = null,
    Object? achivements = null,
    Object? social = null,
    Object? trainings = null,
  }) {
    return _then(_$_LionsMember(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as SingleImage,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as LionsDistrict,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as LionsClub,
      awards: null == awards
          ? _value._awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<MemberAward>,
      achivements: null == achivements
          ? _value._achivements
          : achivements // ignore: cast_nullable_to_non_nullable
              as List<MemberAchivement>,
      social: null == social
          ? _value._social
          : social // ignore: cast_nullable_to_non_nullable
              as List<MemberSocial>,
      trainings: null == trainings
          ? _value._trainings
          : trainings // ignore: cast_nullable_to_non_nullable
              as List<MemberTraining>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LionsMember with DiagnosticableTreeMixin implements _LionsMember {
  const _$_LionsMember(
      {this.username = "",
      this.avatar = const SingleImage(),
      this.name = "",
      this.about = "",
      this.address = "",
      this.phone = "",
      this.district = const LionsDistrict(),
      this.club = const LionsClub(),
      final List<MemberAward> awards = const [MemberAward()],
      final List<MemberAchivement> achivements = const [MemberAchivement()],
      final List<MemberSocial> social = const [MemberSocial()],
      final List<MemberTraining> trainings = const [MemberTraining()]})
      : _awards = awards,
        _achivements = achivements,
        _social = social,
        _trainings = trainings;

  factory _$_LionsMember.fromJson(Map<String, dynamic> json) =>
      _$$_LionsMemberFromJson(json);

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final SingleImage avatar;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String about;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final LionsDistrict district;
  @override
  @JsonKey()
  final LionsClub club;
  final List<MemberAward> _awards;
  @override
  @JsonKey()
  List<MemberAward> get awards {
    if (_awards is EqualUnmodifiableListView) return _awards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_awards);
  }

  final List<MemberAchivement> _achivements;
  @override
  @JsonKey()
  List<MemberAchivement> get achivements {
    if (_achivements is EqualUnmodifiableListView) return _achivements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achivements);
  }

  final List<MemberSocial> _social;
  @override
  @JsonKey()
  List<MemberSocial> get social {
    if (_social is EqualUnmodifiableListView) return _social;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_social);
  }

  final List<MemberTraining> _trainings;
  @override
  @JsonKey()
  List<MemberTraining> get trainings {
    if (_trainings is EqualUnmodifiableListView) return _trainings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainings);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LionsMember(username: $username, avatar: $avatar, name: $name, about: $about, address: $address, phone: $phone, district: $district, club: $club, awards: $awards, achivements: $achivements, social: $social, trainings: $trainings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LionsMember'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('about', about))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('district', district))
      ..add(DiagnosticsProperty('club', club))
      ..add(DiagnosticsProperty('awards', awards))
      ..add(DiagnosticsProperty('achivements', achivements))
      ..add(DiagnosticsProperty('social', social))
      ..add(DiagnosticsProperty('trainings', trainings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LionsMember &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.club, club) || other.club == club) &&
            const DeepCollectionEquality().equals(other._awards, _awards) &&
            const DeepCollectionEquality()
                .equals(other._achivements, _achivements) &&
            const DeepCollectionEquality().equals(other._social, _social) &&
            const DeepCollectionEquality()
                .equals(other._trainings, _trainings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      avatar,
      name,
      about,
      address,
      phone,
      district,
      club,
      const DeepCollectionEquality().hash(_awards),
      const DeepCollectionEquality().hash(_achivements),
      const DeepCollectionEquality().hash(_social),
      const DeepCollectionEquality().hash(_trainings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LionsMemberCopyWith<_$_LionsMember> get copyWith =>
      __$$_LionsMemberCopyWithImpl<_$_LionsMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LionsMemberToJson(
      this,
    );
  }
}

abstract class _LionsMember implements LionsMember {
  const factory _LionsMember(
      {final String username,
      final SingleImage avatar,
      final String name,
      final String about,
      final String address,
      final String phone,
      final LionsDistrict district,
      final LionsClub club,
      final List<MemberAward> awards,
      final List<MemberAchivement> achivements,
      final List<MemberSocial> social,
      final List<MemberTraining> trainings}) = _$_LionsMember;

  factory _LionsMember.fromJson(Map<String, dynamic> json) =
      _$_LionsMember.fromJson;

  @override
  String get username;
  @override
  SingleImage get avatar;
  @override
  String get name;
  @override
  String get about;
  @override
  String get address;
  @override
  String get phone;
  @override
  LionsDistrict get district;
  @override
  LionsClub get club;
  @override
  List<MemberAward> get awards;
  @override
  List<MemberAchivement> get achivements;
  @override
  List<MemberSocial> get social;
  @override
  List<MemberTraining> get trainings;
  @override
  @JsonKey(ignore: true)
  _$$_LionsMemberCopyWith<_$_LionsMember> get copyWith =>
      throw _privateConstructorUsedError;
}
