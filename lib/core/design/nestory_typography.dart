import 'package:flutter/material.dart';

import 'nestory_colors.dart';
import 'nestory_fonts.dart';

/// Figma: the nine Nestory/ text styles, in logical pixels.
abstract final class NestoryTypography {
  static const display = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 28,
    height: 38 / 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const title = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 22,
    height: 32 / 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const section = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 18,
    height: 27 / 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const body = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 16,
    height: 25 / 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const strong = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 16,
    height: 25 / 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const bodySmall = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const caption = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const label = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 14,
    height: 21 / 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );
  static const micro = TextStyle(
    fontFamily: NestoryFonts.family,
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: NestoryColors.textPrimary,
  );

  // Material slots adapt the approved styles; they do not add new type sizes.
  static const textTheme = TextTheme(
    displayLarge: display,
    displayMedium: display,
    displaySmall: display,
    headlineLarge: title,
    headlineMedium: title,
    headlineSmall: title,
    titleLarge: section,
    titleMedium: strong,
    titleSmall: label,
    bodyLarge: body,
    bodyMedium: body,
    bodySmall: bodySmall,
    labelLarge: strong,
    labelMedium: caption,
    labelSmall: micro,
  );
}
