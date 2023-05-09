import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';
part 'location_data.g.dart';

@freezed
class LocationData with _$LocationData {
  const factory LocationData({
    @Default("") String title,
    @Default("") String address,
    @Default("") String contactName,
    @Default("") String contactNumber,
    @Default("") String link,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);
}