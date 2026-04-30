import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

class UiTextFormFieldTheme {
  UiTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: UiColors.darkGrey,
    suffixIconColor: UiColors.darkGrey,
    labelStyle: const TextStyle(color: UiColors.darkGrey),
    floatingLabelStyle: const TextStyle(color: UiColors.dark),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 2, color: UiColors.dark),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: UiColors.grey,
    suffixIconColor: UiColors.grey,
    labelStyle: const TextStyle(color: UiColors.grey),
    floatingLabelStyle: const TextStyle(color: UiColors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 2, color: UiColors.white),
    ),
  );
}
