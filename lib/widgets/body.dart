import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: non_constant_identifier_names
Widget BeautifyBody({
  required Widget child,
}) {
  return [
    [child].vStack(crossAlignment: CrossAxisAlignment.start).px16().expand(),
  ].hStack().py16().scrollVertical();
}
