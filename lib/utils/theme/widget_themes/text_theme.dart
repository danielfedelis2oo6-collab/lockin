import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lockin/constants/colors.dart';

class UiTextTheme {
  UiTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserratAlternates(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: UiColors.textPrimary,
    ),
    displayMedium: GoogleFonts.montserratAlternates(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: UiColors.textPrimary,
    ),
    displaySmall: GoogleFonts.montserratAlternates(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: UiColors.textPrimary,
    ),
    headlineLarge: GoogleFonts.montserratAlternates(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: UiColors.textPrimary,
    ),
    headlineMedium: GoogleFonts.montserratAlternates(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: UiColors.textPrimary,
    ),
    headlineSmall: GoogleFonts.montserratAlternates(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: UiColors.textPrimary,
    ),
    titleLarge: GoogleFonts.montserratAlternates(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: UiColors.textPrimary,
    ),
    bodyLarge: GoogleFonts.montserratAlternates(
      fontSize: 14.0,
      color: UiColors.textPrimary,
    ),
    bodyMedium: GoogleFonts.montserratAlternates(
      fontSize: 14.0,
      color: UiColors.textSecondary,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserratAlternates(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: UiColors.textDarkPrimary,
    ),
    displayMedium: GoogleFonts.montserratAlternates(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: UiColors.textDarkPrimary,
    ),
    displaySmall: GoogleFonts.montserratAlternates(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: UiColors.textDarkPrimary,
    ),
    headlineMedium: GoogleFonts.montserratAlternates(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: UiColors.textDarkPrimary,
    ),
    headlineSmall: GoogleFonts.montserratAlternates(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: UiColors.textDarkPrimary,
    ),
    titleLarge: GoogleFonts.montserratAlternates(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: UiColors.textDarkPrimary,
    ),
    bodyLarge: GoogleFonts.montserratAlternates(
      fontSize: 14.0,
      color: UiColors.textDarkPrimary,
    ),
    bodyMedium: GoogleFonts.montserratAlternates(
      fontSize: 14.0,
      color: UiColors.textDarkSecondary,
    ),
  );
}
