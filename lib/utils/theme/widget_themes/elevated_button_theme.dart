import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class UiElevatedButtonTheme {
  UiElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UiColors.white,
      backgroundColor: UiColors.dark,
      side: const BorderSide(color: UiColors.dark),
      padding: const EdgeInsets.symmetric(vertical: UiSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UiColors.dark,
      backgroundColor: UiColors.white,
      side: const BorderSide(color: UiColors.white),
      padding: const EdgeInsets.symmetric(vertical: UiSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      ),
    ),
  );
}
