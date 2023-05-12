import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lions_flutter/Pages/home/home_page.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lions_flutter/l10n/l10n.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = initializeWidgetsBinding();

  preserveNativeSplash(widgetsBinding);

  await LionsPrefs.init();

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          title: 'Lions 307 ',
          debugShowCheckedModeBanner: false,
          locale: provider.locale,
          supportedLocales: L10n.all,
          theme: ThemeData(useMaterial3: true),
          home: const HomePage(),
        );
      },
    );
  }
}

WidgetsBinding initializeWidgetsBinding() {
  log("Initialize WidgetsBinding...");
  return WidgetsFlutterBinding.ensureInitialized();
}

void preserveNativeSplash(WidgetsBinding widgetsBinding) {
  log("Preserve Native Splash...");
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}
