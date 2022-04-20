import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: non_constant_identifier_names
PreferredSize BeautifyAppBar({
  required BuildContext context,
  required double height,
  required Widget child,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: SizedBox(
      height: height,
      child: Container(
        child: child,
      ),
    ).pOnly(top: MediaQuery.of(context).padding.top),
  );
}
