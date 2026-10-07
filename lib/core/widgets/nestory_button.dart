import 'package:flutter/material.dart';

import '../design/nestory_colors.dart';
import '../design/nestory_radii.dart';
import '../design/nestory_sizes.dart';
import '../design/nestory_spacing.dart';
import '../design/nestory_typography.dart';
import 'nestory_button_variant.dart';
import 'nestory_focus_outline.dart';

/// Displays caller-owned action state; it does not run or await a stored task.
class NestoryButton extends StatefulWidget {
  const NestoryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = NestoryButtonVariant.primary,
    this.enabled = true,
    this.isLoading = false,
    this.loadingLabel = '진행 중이에요',
    this.icon,
    this.focusNode,
    this.autofocus = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final NestoryButtonVariant variant;
  final bool enabled;
  final bool isLoading;
  final String loadingLabel;
  final IconData? icon;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<NestoryButton> createState() => _NestoryButtonState();
}

class _NestoryButtonState extends State<NestoryButton> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final disabled = !widget.enabled || widget.onPressed == null;
    final blocked = disabled || widget.isLoading;
    final secondary = widget.variant == NestoryButtonVariant.secondary;
    final destructive = widget.variant == NestoryButtonVariant.destructive;
    final foreground = disabled
        ? NestoryColors.onDisabled
        : secondary
        ? NestoryColors.primary
        : NestoryColors.onPrimary;
    final background = disabled
        ? NestoryColors.disabledContainer
        : secondary
        ? NestoryColors.surface
        : destructive
        ? NestoryColors.error
        : NestoryColors.primary;

    final focused = !blocked && _focused;
    return Semantics(
      liveRegion: widget.isLoading,
      child: NestoryFocusOutline(
        focused: focused,
        radius: NestoryRadii.button,
        child: TextButton(
          onFocusChange: (focused) => setState(() => _focused = focused),
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          onPressed: blocked ? null : widget.onPressed,
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(
              Size(NestorySizes.minTouchTarget, NestorySizes.buttonMinHeight),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: NestorySpacing.s16,
                vertical: NestorySpacing.s12,
              ),
            ),
            tapTargetSize: MaterialTapTargetSize.padded,
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (!blocked && states.contains(WidgetState.pressed)) {
                if (secondary || destructive) {
                  return secondary
                      ? NestoryColors.primaryContainer
                      : NestoryColors.error;
                }
                return NestoryColors.primaryPressed;
              }
              return background;
            }),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) =>
                  secondary && !blocked && states.contains(WidgetState.pressed)
                  ? NestoryColors.onPrimaryContainer
                  : foreground,
            ),
            textStyle: const WidgetStatePropertyAll(NestoryTypography.strong),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            side: WidgetStateProperty.resolveWith(
              (states) => BorderSide(
                color:
                    (focused ||
                            (!blocked &&
                                states.contains(WidgetState.pressed))) &&
                        !secondary
                    ? NestoryColors.onPrimary
                    : secondary && !disabled
                    ? NestoryColors.outline
                    : Colors.transparent,
                width:
                    focused ||
                        (!blocked && states.contains(WidgetState.pressed))
                    ? NestorySizes.focusBorderWidth
                    : NestorySizes.borderWidth,
              ),
            ),
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(NestoryRadii.button),
                ),
              ),
            ),
            animationDuration: MediaQuery.disableAnimationsOf(context)
                ? Duration.zero
                : const Duration(milliseconds: 120),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isLoading || widget.icon != null) ...[
                ExcludeSemantics(
                  child:
                      widget.isLoading &&
                          !MediaQuery.disableAnimationsOf(context)
                      ? SizedBox.square(
                          dimension: NestorySizes.icon,
                          child: CircularProgressIndicator(
                            color: foreground,
                            strokeWidth: NestorySizes.focusBorderWidth,
                          ),
                        )
                      : Icon(
                          widget.isLoading
                              ? Icons.hourglass_top_outlined
                              : widget.icon,
                          size: NestorySizes.icon,
                          color: foreground,
                        ),
                ),
                const SizedBox(width: NestorySpacing.s8),
              ],
              Flexible(
                child: Text(
                  widget.isLoading ? widget.loadingLabel : widget.label,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
