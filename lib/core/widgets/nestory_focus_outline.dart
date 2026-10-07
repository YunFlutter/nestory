import 'package:flutter/widgets.dart';

import '../design/nestory_colors.dart';
import '../design/nestory_sizes.dart';

/// Reserves the focus border and gap even when focus is absent.
class NestoryFocusOutline extends StatelessWidget {
  const NestoryFocusOutline({
    super.key,
    required this.focused,
    required this.radius,
    required this.child,
  });

  final bool focused;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const inset = NestorySizes.focusBorderWidth + NestorySizes.focusGap;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius + inset),
        border: Border.all(
          color: focused ? NestoryColors.focus : const Color(0x00000000),
          width: NestorySizes.focusBorderWidth,
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(inset), child: child),
    );
  }
}
