// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lions_flutter/app/app_config.dart';
import 'package:lions_flutter/l10n/l10n.dart';
import 'package:lions_flutter/locale_provider.dart';
import 'package:lions_flutter/sports_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _submitting = false;

  void toBack() {
    Navigator.of(context).pop();
  }

  Future signOut() async {
    setState(() {
      _submitting = true;
    });

    try {
      await FirebaseAuth.instance.signOut();

      FirebaseAuth.instance.authStateChanges.call();

      setState(() {
        _submitting = false;
      });

      toBack();
    } catch (e) {
      setState(() {
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ClipRect(
            child: Scaffold(
      appBar: AppBar(
        backgroundColor: appColors[0],
        leading: IconButton(
            onPressed: toBack,
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: appSwatch[600],
            )),
        title: Text(
          "Settings",
          style: TextStyle(color: appSwatch[600]),
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "AppLocalizations.of(context)!.settings_languages",
                    style: textH4,
                  ),
                  DropdownButton2<Locale>(
                    buttonPadding: const EdgeInsets.all(8),
                    isExpanded: true,
                    value: Provider.of<LocaleProvider>(context).locale,
                    items: [
                      DropdownMenuItem<Locale>(
                        value: L10n.all[0],
                        child: Text(
                          "English",
                          style: textH3,
                        ),
                      ),
                      DropdownMenuItem<Locale>(
                        value: L10n.all[1],
                        child: Text(
                          "Indonesia",
                          style: textH3,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        final provider =
                            Provider.of<LocaleProvider>(context, listen: false);

                        provider.setLocale(value!);
                      });
                    },
                  ),
                  Text(
                    "AppLocalizations.of(context)!.settings_sportsmode",
                    style: textH4,
                  ),
                  DropdownButton2(
                    buttonPadding: const EdgeInsets.all(8),
                    isExpanded: true,
                    value: appSportMode,
                    items: [
                      DropdownMenuItem<String>(
                        value: "",
                        child: Text(
                          "All Sports",
                          style: textH3,
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "anggar",
                        child: Text(
                          "Anggar",
                          style: textH3,
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "basket",
                        child: Text(
                          "Basket",
                          style: textH3,
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "volley",
                        child: Text(
                          "Volley",
                          style: textH3,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        appSportMode = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )));
  }
}
