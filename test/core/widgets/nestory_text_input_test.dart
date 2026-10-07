import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_theme.dart';
import 'package:nestory/core/widgets/nestory_text_input.dart';

void main() {
  Future<void> show(WidgetTester tester, Widget child) => tester.pumpWidget(
    MaterialApp(
      theme: NestoryTheme.light,
      home: Scaffold(body: child),
    ),
  );

  testWidgets(
    'label stays visible, edits are forwarded, parent can replace value',
    (tester) async {
      final controller = TextEditingController(text: '기존 값');
      addTearDown(controller.dispose);
      String? changed;
      await show(
        tester,
        NestoryTextInput(
          label: '이름',
          isRequired: true,
          controller: controller,
          onChanged: (value) => changed = value,
        ),
      );
      expect(find.text('이름 (필수)'), findsOneWidget);
      await tester.enterText(find.byType(TextField), '  새로운 이름  ');
      expect(changed, '  새로운 이름  ');
      expect(controller.text, '  새로운 이름  ');
      controller.text = '부모가 전달한 값';
      await tester.pump();
      expect(find.text('부모가 전달한 값'), findsOneWidget);
      expect(find.text('이름 (필수)'), findsOneWidget);
    },
  );

  for (final loading in [false, true]) {
    testWidgets(
      'input is blocked while ${loading ? 'loading' : 'disabled'} and value is retained',
      (tester) async {
        final controller = TextEditingController(text: '유지할 이름');
        addTearDown(controller.dispose);
        var calls = 0;
        await show(
          tester,
          NestoryTextInput(
            label: '이름',
            controller: controller,
            enabled: loading,
            isLoading: loading,
            loadingLabel: '확인하고 있어요',
            onChanged: (_) => calls++,
          ),
        );
        await tester.tap(find.byType(TextField));
        await tester.pump();
        expect(tester.testTextInput.isVisible, false);
        expect(controller.text, '유지할 이름');
        expect(calls, 0);
        if (loading) expect(find.text('확인하고 있어요'), findsOneWidget);
      },
    );
  }

  testWidgets(
    'external error is linked to input and clears without losing text',
    (tester) async {
      final handle = tester.ensureSemantics();
      addTearDown(handle.dispose);
      final controller = TextEditingController(text: '길이가 긴 이름');
      addTearDown(controller.dispose);
      Future<void> render(String? error) => show(
        tester,
        NestoryTextInput(
          label: '이름',
          controller: controller,
          errorText: error,
          helperText: '공간을 구별할 이름을 적어 주세요',
          counterText: '9 / 50자',
        ),
      );
      await render('이름을 다시 확인해 주세요');
      expect(find.text('이름을 다시 확인해 주세요'), findsOneWidget);
      final editable = tester.getSemantics(find.byType(EditableText));
      expect(editable.label, contains('이름'));
      expect(editable.hint, contains('이름을 다시 확인해 주세요'));
      expect(editable.hint, contains('9 / 50자'));
      await render(null);
      expect(find.text('이름을 다시 확인해 주세요'), findsNothing);
      expect(find.text('공간을 구별할 이름을 적어 주세요'), findsOneWidget);
      expect(controller.text, '길이가 긴 이름');
    },
  );

  testWidgets('memo and submission options stay under caller control', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    String? submitted;
    await show(
      tester,
      NestoryTextInput(
        label: '메모',
        controller: controller,
        minLines: 2,
        maxLines: null,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) => submitted = value,
      ),
    );
    await tester.enterText(find.byType(TextField), '첫 줄\n둘째 줄');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    expect(submitted, '첫 줄\n둘째 줄');
  });
}
