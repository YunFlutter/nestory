import 'package:flutter/material.dart';

import '../design/nestory_colors.dart';
import '../design/nestory_radii.dart';
import '../design/nestory_sizes.dart';
import '../design/nestory_spacing.dart';
import '../design/nestory_typography.dart';
import 'nestory_button.dart';
import 'nestory_button_variant.dart';
import 'nestory_status_kind.dart';

class NestoryStatusNotice extends StatelessWidget {
  const NestoryStatusNotice({
    super.key,
    required this.kind,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.actionEnabled = true,
    this.isActionLoading = false,
    this.actionLoadingLabel = '진행 중이에요',
    this.liveRegion = true,
  }) : assert(onAction == null || actionLabel != null);

  final NestoryStatusKind kind;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool actionEnabled;
  final bool isActionLoading;
  final String actionLoadingLabel;
  final bool liveRegion;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: NestoryColors.surface,
      border: Border.all(color: NestoryColors.outline),
      borderRadius: BorderRadius.circular(NestoryRadii.status),
    ),
    child: Padding(
      padding: const EdgeInsets.all(NestorySpacing.s16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            container: true,
            liveRegion: liveRegion,
            label: '${kind.label}. $message',
            excludeSemantics: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(kind.icon, color: kind.color, size: NestorySizes.icon),
                    const SizedBox(width: NestorySpacing.s8),
                    Expanded(
                      child: Text(
                        kind.label,
                        style: NestoryTypography.label.copyWith(
                          color: kind.color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: NestorySpacing.s8),
                Text(
                  message,
                  style: NestoryTypography.body.copyWith(color: kind.color),
                ),
              ],
            ),
          ),
          if (actionLabel != null) ...[
            const SizedBox(height: NestorySpacing.s12),
            NestoryButton(
              label: actionLabel!,
              onPressed: onAction,
              variant: NestoryButtonVariant.secondary,
              enabled: actionEnabled,
              isLoading: isActionLoading,
              loadingLabel: actionLoadingLabel,
            ),
          ],
        ],
      ),
    ),
  );
}
