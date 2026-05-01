import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/* -- Light & Dark Text Button Themes -- */
class UiTextButtonTheme {
  UiTextButtonTheme._(); // To avoid creating instances

  /* -- Light Theme -- */
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: UiColors.dark, // text & icon color
      padding: const EdgeInsets.symmetric(
        vertical: UiSizes.textButtonHeight,
        horizontal: UiSizes.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: UiColors.white, // text & icon color
      padding: const EdgeInsets.symmetric(
        vertical: UiSizes.textButtonHeight,
        horizontal: UiSizes.md,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      ),
    ),
  );
}
