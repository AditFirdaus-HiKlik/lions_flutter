import 'dart:developer';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:lions_flutter/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Locale currentLocale() => Provider.of<LocaleProvider>(context).locale!;

  Future<void> setLanguage(Locale locale) async {
    setState(() {
      Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const Text(
          'Language Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(child: _buildLanguageList()),
    );
  }

  Widget _buildLanguageList() {
    return Column(
      children: [
        _buildLanguageItem(
          'English',
          'en',
          'US',
          currentLocale().languageCode == 'en',
        ),
        _buildLanguageItem(
          'Indonesia',
          'id',
          'ID',
          currentLocale().languageCode == 'id',
        ),
      ],
    );
  }

  Widget _buildLanguageItem(
    String title,
    String languageCode,
    String countryCode,
    bool isSelected,
  ) {
    return ListTile(
      title: Text(title),
      leading: Flag.fromString(
        countryCode,
        height: 30,
        width: 30,
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : null,
      onTap: () {
        setLanguage(Locale(languageCode));
      },
    );
  }
}
