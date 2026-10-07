import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../design/nestory_colors.dart';
import '../design/nestory_radii.dart';
import '../design/nestory_sizes.dart';
import '../design/nestory_spacing.dart';
import '../design/nestory_typography.dart';
import 'nestory_focus_outline.dart';

/// The caller owns and disposes the controller and supplies validation results.
class NestoryTextInput extends StatefulWidget {
  const NestoryTextInput({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.isRequired = false,
    this.enabled = true,
    this.readOnly = false,
    this.isLoading = false,
    this.loadingLabel = '확인하고 있어요',
    this.errorText,
    this.helperText,
    this.counterText,
    this.hintText,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool isRequired;
  final bool enabled;
  final bool readOnly;
  final bool isLoading;
  final String loadingLabel;
  final String? errorText;
  final String? helperText;
  final String? counterText;
  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool obscureText;

  @override
  State<NestoryTextInput> createState() => _NestoryTextInputState();
}

class _NestoryTextInputState extends State<NestoryTextInput> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.enabled && !widget.isLoading;
    final label = '${widget.label} (${widget.isRequired ? '필수' : '선택'})';
    final message = widget.errorText ?? widget.helperText;
    final hints = [
      ?message,
      ?widget.counterText,
      if (widget.isLoading) widget.loadingLabel,
    ].join('. ');
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(NestoryRadii.input),
      borderSide: BorderSide(
        color: widget.errorText == null
            ? NestoryColors.outline
            : NestoryColors.error,
        width: NestorySizes.borderWidth,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ExcludeSemantics(child: Text(label, style: NestoryTypography.label)),
        const SizedBox(height: NestorySpacing.s8),
        Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onFocusChange: (focused) => setState(() => _focused = focused),
          child: NestoryFocusOutline(
            focused: active && _focused,
            radius: NestoryRadii.input,
            child: Semantics(
              label: label,
              hint: hints,
              validationResult: widget.errorText == null
                  ? SemanticsValidationResult.none
                  : SemanticsValidationResult.invalid,
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                enabled: active,
                readOnly: widget.readOnly,
                onChanged: active ? widget.onChanged : null,
                onSubmitted: active ? widget.onSubmitted : null,
                autofocus: widget.autofocus,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                obscureText: widget.obscureText,
                style: NestoryTypography.body.copyWith(
                  color: active
                      ? NestoryColors.textPrimary
                      : NestoryColors.onDisabled,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: NestoryTypography.body.copyWith(
                    color: NestoryColors.textSecondary,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: active
                      ? NestoryColors.surface
                      : NestoryColors.disabledContainer,
                  constraints: const BoxConstraints(
                    minHeight: NestorySizes.inputMinHeight,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: NestorySpacing.s16,
                    vertical: NestorySpacing.s16,
                  ),
                  border: border,
                  enabledBorder: border,
                  disabledBorder: border.copyWith(
                    borderSide: const BorderSide(color: NestoryColors.outline),
                  ),
                  focusedBorder: border.copyWith(
                    borderSide: BorderSide(
                      color: widget.errorText == null
                          ? NestoryColors.focus
                          : NestoryColors.error,
                      width: NestorySizes.focusBorderWidth,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: NestorySpacing.s8),
          Semantics(
            liveRegion: widget.errorText != null,
            child: Text(
              widget.errorText == null ? message : '오류: $message',
              style: NestoryTypography.bodySmall.copyWith(
                color: widget.errorText == null
                    ? NestoryColors.textSecondary
                    : NestoryColors.error,
              ),
            ),
          ),
        ],
        if (widget.counterText != null) ...[
          const SizedBox(height: NestorySpacing.s4),
          Text(widget.counterText!, style: NestoryTypography.bodySmall),
        ],
        if (widget.isLoading) ...[
          const SizedBox(height: NestorySpacing.s8),
          Semantics(
            liveRegion: true,
            child: Text(
              widget.loadingLabel,
              style: NestoryTypography.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}
