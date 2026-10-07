import 'package:flutter/material.dart';

import 'nestory_colors.dart';
import 'nestory_fonts.dart';
import 'nestory_radii.dart';
import 'nestory_typography.dart';

/// Adapts Nestory tokens to the existing Material host.
abstract final class NestoryTheme {
  static final light = ThemeData(
    fontFamily: NestoryFonts.family,
    textTheme: NestoryTypography.textTheme,
    scaffoldBackgroundColor: NestoryColors.background,
    disabledColor: NestoryColors.onDisabled,
    dividerColor: NestoryColors.divider,
    colorScheme: const ColorScheme.light(
      primary: NestoryColors.primary,
      onPrimary: NestoryColors.onPrimary,
      primaryContainer: NestoryColors.primaryContainer,
      onPrimaryContainer: NestoryColors.onPrimaryContainer,
      secondary: NestoryColors.accent,
      onSecondary: NestoryColors.onAccent,
      secondaryContainer: NestoryColors.primaryContainer,
      onSecondaryContainer: NestoryColors.onPrimaryContainer,
      tertiary: NestoryColors.tertiary,
      onTertiary: NestoryColors.onAccent,
      tertiaryContainer: NestoryColors.primaryContainer,
      onTertiaryContainer: NestoryColors.onPrimaryContainer,
      error: NestoryColors.error,
      onError: NestoryColors.errorContainer,
      errorContainer: NestoryColors.errorContainer,
      onErrorContainer: NestoryColors.error,
      surface: NestoryColors.surface,
      onSurface: NestoryColors.textPrimary,
      onSurfaceVariant: NestoryColors.textSecondary,
      outline: NestoryColors.outline,
      outlineVariant: NestoryColors.divider,
      surfaceDim: NestoryColors.surfaceSubtle,
      surfaceBright: NestoryColors.surface,
      surfaceContainerLowest: NestoryColors.surface,
      surfaceContainerLow: NestoryColors.surfaceSubtle,
      surfaceContainer: NestoryColors.surfaceSubtle,
      surfaceContainerHigh: NestoryColors.surfaceSubtle,
      surfaceContainerHighest: NestoryColors.surfaceSubtle,
      inverseSurface: NestoryColors.textPrimary,
      onInverseSurface: NestoryColors.surface,
      inversePrimary: NestoryColors.primaryContainer,
      primaryFixed: NestoryColors.primaryContainer,
      primaryFixedDim: NestoryColors.primaryContainer,
      onPrimaryFixed: NestoryColors.onPrimaryContainer,
      onPrimaryFixedVariant: NestoryColors.onPrimaryContainer,
      secondaryFixed: NestoryColors.primaryContainer,
      secondaryFixedDim: NestoryColors.primaryContainer,
      onSecondaryFixed: NestoryColors.onPrimaryContainer,
      onSecondaryFixedVariant: NestoryColors.onPrimaryContainer,
      tertiaryFixed: NestoryColors.primaryContainer,
      tertiaryFixedDim: NestoryColors.primaryContainer,
      onTertiaryFixed: NestoryColors.onPrimaryContainer,
      onTertiaryFixedVariant: NestoryColors.onPrimaryContainer,
      surfaceTint: Colors.transparent,
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: NestoryColors.surface,
      foregroundColor: NestoryColors.textPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: NestoryTypography.title,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: NestoryColors.primary,
      foregroundColor: NestoryColors.onPrimary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(NestoryRadii.button)),
      ),
    ),
  );
}
