import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';

class UiAppBarTheme {
  UiAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: UiColors.dark, size: 18.0),
    actionsIconTheme: IconThemeData(color: UiColors.dark, size: 18.0),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: UiColors.white, size: 18.0),
    actionsIconTheme: IconThemeData(color: UiColors.white, size: 18.0),
  );
}
