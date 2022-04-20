import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return "Hello Body".text.make();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildBody(context)));
  }
}
