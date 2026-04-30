import 'package:flutter/material.dart';
import 'package:lockin/utils/theme/widget_themes/appbar_theme.dart';
import 'package:lockin/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:lockin/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:lockin/utils/theme/widget_themes/chip_theme.dart';
import 'package:lockin/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:lockin/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:lockin/utils/theme/widget_themes/text_button_theme.dart';
import 'package:lockin/utils/theme/widget_themes/text_field_theme.dart';
import 'package:lockin/utils/theme/widget_themes/text_theme.dart';

class UiAppTheme {
  UiAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: UiTextTheme.lightTextTheme,
    appBarTheme: UiAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: UiElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: UiOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: UiTextButtonTheme.lightTextButtonTheme,
    inputDecorationTheme: UiTextFormFieldTheme.lightInputDecorationTheme,
    checkboxTheme: UiCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: UiBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: UiChipTheme.lightChipTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,
    textTheme: UiTextTheme.darkTextTheme,
    appBarTheme: UiAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: UiElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: UiOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: UiTextButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: UiTextFormFieldTheme.darkInputDecorationTheme,
    checkboxTheme: UiCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: UiBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: UiChipTheme.darkChipTheme,
  );
}
