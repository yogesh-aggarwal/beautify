import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSize BeautifyBottomAppBar({
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
    ),
  );
}
