import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lions_flutter/models/lions_club/lions_club.dart';
import 'package:lions_flutter/models/lions_district/lions_district.dart';
import 'package:lions_flutter/models/lions_rank/lions_rank.dart';
import 'package:lions_flutter/models/member_achivement/member_achivement.dart';
import 'package:lions_flutter/models/member_award/member_award.dart';
import 'package:lions_flutter/models/member_social/member_social.dart';
import 'package:lions_flutter/models/member_training/member_training.dart';
import 'package:lions_flutter/models/single_image/single_image.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @Default(0) int id,
    @Default("") String memberID,
    @Default("") String username,
    @Default("") String email,
    @Default(false) bool confirmed,
    @Default(false) bool blocked,
    @Default(SingleImage()) SingleImage avatar,
    @Default("") String name,
    @Default("") String about,
    @Default("") String address,
    @Default(LionsRank()) LionsRank rank,
    @Default("") String phone,
    @Default(LionsDistrict()) LionsDistrict district,
    @Default(LionsClub()) LionsClub club,
    @Default([MemberAward()]) List<MemberAward> awards,
    @Default([MemberAchivement()]) List<MemberAchivement> achivements,
    @Default([MemberSocial()]) List<MemberSocial> socials,
    @Default([MemberTraining()]) List<MemberTraining> trainings,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
