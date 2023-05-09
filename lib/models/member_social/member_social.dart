import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_social.freezed.dart';
part 'member_social.g.dart';

@freezed
class MemberSocial with _$MemberSocial {
  const factory MemberSocial({
    @Default("") String platform,
    @Default("") String user,
    @Default(false) bool visible,
  }) = _MemberSocial;

  factory MemberSocial.fromJson(Map<String, dynamic> json) => _$MemberSocialFromJson(json);
}
