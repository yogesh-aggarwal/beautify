import 'package:beautify/core/routes.dart';
import 'package:beautify/core/theme.dart';
import 'package:beautify/pages/intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BeautifyApp());
}

class BeautifyApp extends StatelessWidget {
  const BeautifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: IntroPage(),
      routes: {
        Routes.intro: (context) => IntroPage(),
      },
      initialRoute: Routes.intro,
    );
  }
}
