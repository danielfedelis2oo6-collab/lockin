import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';

class UiChipTheme {
  UiChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: UiColors.white,
    selectedColor: UiColors.primary,
    disabledColor: UiColors.grey.withAlpha(102),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: const TextStyle(color: UiColors.black, fontFamily: 'Urbanist'),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    checkmarkColor: UiColors.white,
    selectedColor: UiColors.primary,
    disabledColor: UiColors.darkerGrey,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: UiColors.white, fontFamily: 'Urbanist'),
  );
}
