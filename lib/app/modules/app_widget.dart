import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Challenge',
      darkTheme:  ThemeData(
        primaryColor: Color.fromRGBO(29, 29, 36, 1),
        accentColor: Color.fromRGBO(255, 173, 1, 1),
        scaffoldBackgroundColor: Color.fromRGBO(20, 20, 26, 1),
        cardColor: Color.fromRGBO(45, 45, 55, 1),
        errorColor: Color.fromRGBO(255, 77, 106, 1),
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}