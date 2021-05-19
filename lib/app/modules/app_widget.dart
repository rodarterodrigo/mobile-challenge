import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Rescue',
      theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
          primaryColorLight: Theme.of(context).primaryColorLight,
          buttonTheme: ButtonThemeData(
            buttonColor: Theme.of(context).primaryColor,
          ),
          iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
          textTheme: TextTheme(
              bodyText2: TextStyle(
                color: Colors.grey[600],
              ),
              bodyText1: TextStyle(color: Colors.grey[800])),
          unselectedWidgetColor: Colors.grey[300],
          backgroundColor: Colors.grey[100]),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}