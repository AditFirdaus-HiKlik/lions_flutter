import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lions_flutter/Pages/home/home_page.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/locale_provider.dart';
import 'package:lions_flutter/l10n/l10n.dart';
import 'package:lions_flutter/models/api_client/api_client.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await LionsPrefs.init();

  await ApiClient.setBaseUrl("lions.up.railway.app");

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          title: 'Lions 307 B1',
          locale: provider.locale,
          supportedLocales: L10n.all,
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomePage(),
        );
      },
    );
  }
}

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
    backgroundColor: Colors.white,
    accentColor: Colors.orangeAccent,
  ),
  useMaterial3: true,
  visualDensity: VisualDensity.comfortable,
);
