import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class UiOutlinedButtonTheme {
  UiOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: UiColors.dark,
      side: const BorderSide(color: UiColors.dark),
      padding: const EdgeInsets.symmetric(vertical: UiSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: UiColors.white,
      side: const BorderSide(color: UiColors.white),
      padding: const EdgeInsets.symmetric(vertical: UiSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      ),
    ),
  );
}
