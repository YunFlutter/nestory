import 'package:flutter/material.dart';

import '../design/nestory_colors.dart';
import '../design/nestory_radii.dart';
import '../design/nestory_sizes.dart';
import '../design/nestory_spacing.dart';
import '../design/nestory_typography.dart';
import 'nestory_photo_kind.dart';

/// A non-interactive placeholder that can grow to keep its type label visible.
class NestoryPhotoPlaceholder extends StatelessWidget {
  const NestoryPhotoPlaceholder({super.key, required this.kind});

  final NestoryPhotoKind kind;

  @override
  Widget build(BuildContext context) => Semantics(
    container: true,
    image: true,
    label: kind.label,
    excludeSemantics: true,
    child: Container(
      constraints: const BoxConstraints(minHeight: NestorySizes.thumbnail),
      decoration: BoxDecoration(
        color: NestoryColors.surfaceSubtle,
        borderRadius: BorderRadius.circular(NestoryRadii.photo),
      ),
      padding: const EdgeInsets.all(NestorySpacing.s12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            kind.icon,
            size: NestorySizes.icon,
            color: NestoryColors.textSecondary,
          ),
          const SizedBox(height: NestorySpacing.s8),
          Text(
            kind.label,
            textAlign: TextAlign.center,
            style: NestoryTypography.bodySmall.copyWith(
              color: NestoryColors.textSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}
