import 'package:flutter/material.dart';
import 'package:lions_flutter/app/app_config.dart';

TextStyle textH1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: appSwatch[600],
);

TextStyle textH2 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: appSwatch[600],
);

TextStyle textH3 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: appSwatch[600],
);

TextStyle textH4 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: appColors[2],
);

TextStyle textH5 = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.w500,
  color: appColors[2],
);

void scaffoldMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
