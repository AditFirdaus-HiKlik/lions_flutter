import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lions_flutter/models/single_image/single_image.dart';

part 'event_data.freezed.dart';
part 'event_data.g.dart';

@freezed
class EventData with _$EventData {
  const factory EventData({
    @Default("") String title,
    @Default(SingleImage()) SingleImage coverImage,
    @Default("") String organizingClub,
    @Default("") String dateTime,
    @Default("") String location,
    @Default("") String picContact,
    @Default("") String donationAccount,
  }) = _EventData;

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);
}
