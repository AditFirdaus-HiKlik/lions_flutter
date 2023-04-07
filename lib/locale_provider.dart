import 'package:flutter/material.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale = L10n.all.first;

  Locale? get locale {
    if (LionsPrefs.instance.containsKey("app_lang")) {
      String langKey = LionsPrefs.instance.getString("app_lang")!;

      switch (langKey) {
        case "en":
          _locale = L10n.all[0];
          break;
        case "id":
          _locale = L10n.all[1];
          break;
        default:
          _locale = L10n.all.first;
          break;
      }
    }

    LionsPrefs.instance.setString("app_lang", _locale!.languageCode);

    return _locale;
  }

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;

    LionsPrefs.instance.setString("app_lang", _locale!.languageCode);

    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
