import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_colors.dart';
import 'package:nestory/core/design/nestory_radii.dart';
import 'package:nestory/core/design/nestory_spacing.dart';
import 'package:nestory/core/design/nestory_typography.dart';

void main() {
  // Compare public tokens to the approved source, rather than copying hex/size
  // expectations into a second specification.
  final design = File('DESIGN.md').readAsStringSync();

  test('all Figma color roles match the approved design source', () {
    final colors = {
      'background': NestoryColors.background,
      'surface': NestoryColors.surface,
      'surfaceSubtle': NestoryColors.surfaceSubtle,
      'textPrimary': NestoryColors.textPrimary,
      'textSecondary': NestoryColors.textSecondary,
      'primary': NestoryColors.primary,
      'onPrimary': NestoryColors.onPrimary,
      'primaryPressed': NestoryColors.primaryPressed,
      'primaryContainer': NestoryColors.primaryContainer,
      'onPrimaryContainer': NestoryColors.onPrimaryContainer,
      'accent': NestoryColors.accent,
      'onAccent': NestoryColors.onAccent,
      'outline': NestoryColors.outline,
      'divider': NestoryColors.divider,
      'focus': NestoryColors.focus,
      'disabledContainer': NestoryColors.disabledContainer,
      'onDisabled': NestoryColors.onDisabled,
      'success': NestoryColors.success,
      'successContainer': NestoryColors.successContainer,
      'warning': NestoryColors.warning,
      'warningContainer': NestoryColors.warningContainer,
      'error': NestoryColors.error,
      'errorContainer': NestoryColors.errorContainer,
      'info': NestoryColors.info,
      'infoContainer': NestoryColors.infoContainer,
      'tertiary': NestoryColors.tertiary,
    };
    final entries = RegExp(
      r'^  (\w+): "#([A-F0-9]{6})"$',
      multiLine: true,
    ).allMatches(design);
    expect(entries, hasLength(26));
    expect(colors.keys, unorderedEquals(entries.map((entry) => entry[1])));
    for (final entry in entries) {
      expect(
        colors[entry[1]],
        Color(0xFF000000 | int.parse(entry[2]!, radix: 16)),
        reason: entry[1],
      );
    }
  });

  test('nine type roles retain Figma size, line height and weight', () {
    final styles = {
      'display': NestoryTypography.display,
      'h1': NestoryTypography.title,
      'h2': NestoryTypography.section,
      'body': NestoryTypography.body,
      'strong': NestoryTypography.strong,
      'bodySmall': NestoryTypography.bodySmall,
      'caption': NestoryTypography.caption,
      'label': NestoryTypography.label,
      'micro': NestoryTypography.micro,
    };
    final entries = RegExp(
      r'^  (\w+):\n'
      r'    fontFamily: (.+)\n'
      r'    fontSize: "(\d+)px"\n'
      r'    lineHeight: "(\d+)px"\n'
      r'    fontWeight: (\d+)',
      multiLine: true,
    ).allMatches(design);
    expect(entries, hasLength(9));
    expect(styles.keys, unorderedEquals(entries.map((entry) => entry[1])));
    for (final entry in entries) {
      final style = styles[entry[1]]!;
      expect(style.fontFamily, entry[2], reason: entry[1]);
      expect(style.fontSize, double.parse(entry[3]!), reason: entry[1]);
      expect(
        style.height,
        double.parse(entry[4]!) / double.parse(entry[3]!),
        reason: entry[1],
      );
      expect(style.fontWeight!.value, int.parse(entry[5]!), reason: entry[1]);
      expect(style.letterSpacing, 0, reason: 'Figma text style ${entry[1]}');
    }
  });

  test('spacing scale and shape roles match the approved source', () {
    final spacingBlock = design.split('spacing:\n')[1].split('rounded:\n')[0];
    final sourceSpacing = RegExp(r': (\d+)').allMatches(spacingBlock);
    expect([
      NestorySpacing.s4,
      NestorySpacing.s8,
      NestorySpacing.s12,
      NestorySpacing.s16,
      NestorySpacing.s24,
      NestorySpacing.s32,
      NestorySpacing.s40,
      NestorySpacing.s48,
    ], sourceSpacing.map((entry) => double.parse(entry[1]!)));
    final radii = {
      'status': NestoryRadii.status,
      'input': NestoryRadii.input,
      'button': NestoryRadii.button,
      'card': NestoryRadii.card,
      'photo': NestoryRadii.photo,
      'sheet': NestoryRadii.sheet,
    };
    final radiusBlock = design.split('rounded:\n')[1].split('motion:\n')[0];
    final sourceRadii = RegExp(r'  (\w+): (\d+)').allMatches(radiusBlock);
    expect(radii.keys, unorderedEquals(sourceRadii.map((entry) => entry[1])));
    for (final entry in sourceRadii) {
      expect(radii[entry[1]], double.parse(entry[2]!), reason: entry[1]);
    }
  });
}
