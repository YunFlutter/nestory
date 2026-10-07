import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_colors.dart';
import 'package:nestory/core/design/nestory_theme.dart';
import 'package:nestory/core/widgets/nestory_button.dart';
import 'package:nestory/core/widgets/nestory_button_variant.dart';

void main() {
  Future<void> show(WidgetTester tester, Widget child) => tester.pumpWidget(
    MaterialApp(
      theme: NestoryTheme.light,
      home: Scaffold(body: child),
    ),
  );

  for (final variant in NestoryButtonVariant.values) {
    testWidgets('$variant forwards an enabled action', (tester) async {
      var calls = 0;
      await show(
        tester,
        NestoryButton(label: '실행', variant: variant, onPressed: () => calls++),
      );
      await tester.tap(find.text('실행'));
      await tester.pump();
      expect(calls, 1);
    });

    for (final loading in [false, true]) {
      testWidgets(
        '$variant blocks ${loading ? 'loading' : 'disabled'} actions',
        (tester) async {
          final handle = tester.ensureSemantics();
          addTearDown(handle.dispose);
          var calls = 0;
          await show(
            tester,
            NestoryButton(
              label: '실행',
              loadingLabel: '실행하고 있어요',
              variant: variant,
              enabled: loading,
              isLoading: loading,
              onPressed: () => calls++,
            ),
          );
          await tester.tap(find.byType(TextButton));
          await tester.sendKeyEvent(LogicalKeyboardKey.enter);
          await tester.pump();
          expect(calls, 0);
          expect(
            tester.getSemantics(find.byType(TextButton)),
            matchesSemantics(
              label: loading ? '실행하고 있어요' : '실행',
              isButton: true,
              hasEnabledState: true,
              isEnabled: false,
            ),
          );
        },
      );
    }
  }

  testWidgets(
    'parent loading state prevents repeated submission and recovers',
    (tester) async {
      var loading = false;
      var calls = 0;
      late StateSetter update;
      await show(
        tester,
        StatefulBuilder(
          builder: (context, setState) {
            update = setState;
            return NestoryButton(
              label: '저장',
              loadingLabel: '저장하고 있어요',
              isLoading: loading,
              onPressed: () {
                calls++;
                setState(() => loading = true);
              },
            );
          },
        ),
      );
      await tester.tap(find.text('저장'));
      await tester.pump();
      expect(find.text('저장하고 있어요'), findsOneWidget);
      await tester.tap(find.byType(TextButton));
      await tester.pump();
      expect(calls, 1);
      update(() => loading = false);
      await tester.pump();
      await tester.tap(find.text('저장'));
      expect(calls, 2);
    },
  );

  testWidgets('pressed primary button uses the approved pressed color', (
    tester,
  ) async {
    await show(tester, NestoryButton(label: '저장', onPressed: () {}));
    final material = find.descendant(
      of: find.byType(TextButton),
      matching: find.byType(Material),
    );
    expect(tester.widget<Material>(material).color, NestoryColors.primary);
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('저장')),
    );
    await tester.pump(const Duration(milliseconds: 200));
    expect(
      tester.widget<Material>(material).color,
      NestoryColors.primaryPressed,
    );
    await gesture.up();
  });
}
