import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lions_flutter/models/lions_club/lions_club.dart';
import 'package:lions_flutter/models/lions_district/lions_district.dart';
import 'package:lions_flutter/models/member_achivement/member_achivement.dart';
import 'package:lions_flutter/models/member_award/member_award.dart';
import 'package:lions_flutter/models/member_social/member_social.dart';
import 'package:lions_flutter/models/member_training/member_training.dart';
import 'package:lions_flutter/models/single_image/single_image.dart';

part 'lions_member.freezed.dart';
part 'lions_member.g.dart';

@freezed
class LionsMember with _$LionsMember {
  const factory LionsMember({
    @Default("") String username,
    @Default(SingleImage()) SingleImage avatar,
    @Default("") String name,
    @Default("") String about,
    @Default("") String address,
    @Default("") String phone,
    @Default(LionsDistrict()) LionsDistrict district,
    @Default(LionsClub()) LionsClub club,
    @Default([MemberAward()]) List<MemberAward> awards,
    @Default([MemberAchivement()]) List<MemberAchivement> achivements,
    @Default([MemberSocial()]) List<MemberSocial> social,
    @Default([MemberTraining()]) List<MemberTraining> trainings,
  }) = _LionsMember;

  factory LionsMember.fromJson(Map<String, dynamic> json) => _$LionsMemberFromJson(json);
}
