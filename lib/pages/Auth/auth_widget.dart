import 'package:flutter/material.dart';
import 'package:lions_flutter/app/app_config.dart';

class AuthTextFieldDecoration extends InputDecoration {
  AuthTextFieldDecoration(String label)
      : super(
          filled: true,
          isDense: true,
          fillColor: appColors[1],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          label: Text(label),
        );
}
