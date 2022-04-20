import 'package:beautify/core/routes.dart';
import 'package:beautify/core/store.dart';
import 'package:beautify/core/theme.dart';
import 'package:beautify/pages/home.dart';
import 'package:beautify/pages/intro.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: GStore(),
    child: BeautifyApp(),
  ));
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return ClampingScrollPhysics();
    }
  }
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
        Routes.home: (context) => HomePage(),
      },
      initialRoute: Routes.intro,
      builder: (context, widget) {
        return ScrollConfiguration(
          behavior: ScrollBehaviorModified(),
          child: widget ?? Container(),
        );
      },
    );
  }
}
