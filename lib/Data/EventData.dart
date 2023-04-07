// To parse this JSON data, do
//
//     final eventData = eventDataFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

import 'package:lions_flutter/Classes/user/user_data.dart';

class EventData {
  EventData();

  int id = 0;
  EventAttributes attributes = EventAttributes();

  factory EventData.fromRawJson(String str) =>
      EventData.fromJson(json.decode(str));

  factory EventData.fromJson(Map<String, dynamic> json) {
    var eventData = EventData();

    eventData.id = json["id"];
    eventData.attributes = EventAttributes.fromJson(json["attributes"]);

    return eventData;
  }
}

class EventAttributes {
  EventAttributes();

  String title = "";
  DateTime datetime = DateTime.now();
  String type = "";
  String address = "";
  dynamic contactName = "";
  String contactNumber = "";
  SingleImage coverImage = SingleImage();

  factory EventAttributes.fromRawJson(String str) =>
      EventAttributes.fromJson(json.decode(str));

  factory EventAttributes.fromJson(Map<String, dynamic> json) {
    var attributes = EventAttributes();

    attributes.title = json["title"] ?? "";
    attributes.datetime = DateTime.parse(json["datetime"] ?? "");
    attributes.type = json["type"] ?? "";
    attributes.address = json["address"] ?? "";
    attributes.contactName = json["contactName"] ?? "";
    attributes.contactNumber = json["contactNumber"] ?? "";
    attributes.coverImage =
        SingleImage.fromMap(json["coverImage"]["data"]["attributes"]);

    return attributes;
  }
}
