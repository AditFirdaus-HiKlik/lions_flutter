// To parse this JSON data, do
//
//     final locationData = locationDataFromJson(jsonString);

import 'dart:convert';

class LocationData {
  LocationData();

  int id = 0;
  LocationAttributes attributes = LocationAttributes();

  factory LocationData.fromRawJson(String str) =>
      LocationData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationData.fromJson(Map<String, dynamic> json) {
    var locationData = LocationData();

    locationData.id = json["id"] ?? 0;
    locationData.attributes = json["attributes"] != null
        ? LocationAttributes.fromJson(json["attributes"])
        : locationData.attributes;

    return locationData;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class LocationAttributes {
  LocationAttributes();

  String title = "";
  String address = "";
  dynamic contactName = "";
  String contactNumber = "";
  String link = "";

  factory LocationAttributes.fromRawJson(String str) =>
      LocationAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationAttributes.fromJson(Map<String, dynamic> json) {
    var attributes = LocationAttributes();

    attributes.title = json["title"] ?? "";
    attributes.address = json["address"] ?? "";
    attributes.contactName = json["contactName"] ?? "";
    attributes.contactNumber = json["contactNumber"] ?? "";
    attributes.link = json["link"] ?? "";

    return attributes;
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "address": address,
        "contactName": contactName,
        "contactNumber": contactNumber,
        "link": link,
      };
}
