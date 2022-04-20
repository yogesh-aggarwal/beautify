import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: non_constant_identifier_names
Widget BeautifyBody({
  required Widget child,
  double hPadding = 16.0,
  double vPadding = 16.0,
}) {
  return [
    [child]
        .vStack(crossAlignment: CrossAxisAlignment.start)
        .pSymmetric(h: hPadding)
        .expand(),
  ].hStack().pSymmetric(v: vPadding).scrollVertical();
}
