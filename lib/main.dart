import 'package:beautify/pages/intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BeautifyApp());
}

class BeautifyApp extends StatelessWidget {
  const BeautifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
    );
  }
}
