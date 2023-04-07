import 'dart:io';

import 'package:flutter/material.dart';

// Check if ios or android
bool isIos = Platform.isIOS;

String appLanguage = "en";
String appSportMode = "";

const List<Color> appColors = [
  Color(0xFFFFFFFF),
  Color(0xFFF5F6FA),
  Color(0xFF535C68),
  Color(0xFF353B48),
  Color(0xFFE84118),
];

MaterialColor appSwatch = const MaterialColor(
  0xFF000000,
  <int, Color>{
    50: Color(0xFFE0E0E0),
    100: Color(0xFFBDBDBD),
    200: Color(0xFF9E9E9E),
    300: Color(0xFF757575),
    400: Color(0xFF616161),
    500: Color(0xFF424242),
    600: Color(0xFF212121),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

List<String> sportList = [
  "tennis",
  "futsal",
  "basket",
  "volley",
  "fencing",
  "badminton",
  "shooting",
  "automotive",
  "football",
  "table tennis",
  "boxing",
  "swimming",
  "general",
];

List<String> jobList = [
  "athlete",
  "coach",
  "participant",
];
