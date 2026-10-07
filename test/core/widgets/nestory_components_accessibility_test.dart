import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_fonts.dart';
import 'package:nestory/core/design/nestory_sizes.dart';
import 'package:nestory/core/design/nestory_theme.dart';
import 'package:nestory/core/widgets/nestory_button.dart';
import 'package:nestory/core/widgets/nestory_button_variant.dart';
import 'package:nestory/core/widgets/nestory_focus_outline.dart';
import 'package:nestory/core/widgets/nestory_photo_kind.dart';
import 'package:nestory/core/widgets/nestory_photo_placeholder.dart';
import 'package:nestory/core/widgets/nestory_status_kind.dart';
import 'package:nestory/core/widgets/nestory_status_notice.dart';
import 'package:nestory/core/widgets/nestory_text_input.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await (FontLoader(
      NestoryFonts.family,
    )..addFont(rootBundle.load(NestoryFonts.asset))).load();
  });

  Future<void> show(
    WidgetTester tester,
    Widget child, {
    bool reducedMotion = false,
  }) => tester.pumpWidget(
    MaterialApp(
      theme: NestoryTheme.light,
      home: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(disableAnimations: reducedMotion),
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: child,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  for (final width in [360.0, 390.0, 430.0]) {
    for (final scale in [1.0, 3.2]) {
      testWidgets('all component states fit $width at text scale $scale', (
        tester,
      ) async {
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = Size(width, 800);
        tester.platformDispatcher.textScaleFactorTestValue = scale;
        addTearDown(tester.view.resetDevicePixelRatio);
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
        final controller = TextEditingController(text: '입력값');
        addTearDown(controller.dispose);
        final cases = <Widget>[
          for (final variant in NestoryButtonVariant.values)
            for (final state in ['default', 'loading', 'disabled'])
              NestoryButton(
                label: '이 위치로 이동하고 계속 작성',
                loadingLabel: '현재 내용을 확인하고 있어요',
                variant: variant,
                enabled: state != 'disabled',
                isLoading: state == 'loading',
                icon: Icons.add,
                onPressed: () {},
              ),
          for (final state in ['default', 'error', 'loading', 'disabled'])
            NestoryTextInput(
              label: '물건 이름과 보관 위치를 구별할 이름',
              controller: controller,
              isRequired: true,
              helperText: '나중에 찾을 수 있도록 알아보기 쉽게 적어 주세요',
              errorText: state == 'error'
                  ? '입력한 내용을 다시 확인하고 이어서 작성해 주세요'
                  : null,
              counterText: '글자 수는 호출자가 전달한 안내입니다',
              enabled: state != 'disabled',
              isLoading: state == 'loading',
              loadingLabel: '입력한 내용을 확인하고 있어요',
            ),
          NestoryTextInput(
            label: '메모',
            controller: controller,
            minLines: 2,
            maxLines: null,
          ),
          for (final kind in NestoryStatusKind.values)
            NestoryStatusNotice(
              kind: kind,
              message: '현재 상태와 해결 방법을 확인하고 이어서 작성해 주세요',
              actionLabel: '최신 내용을 확인하고 이어서 작성',
              onAction: () {},
            ),
          NestoryStatusNotice(
            kind: NestoryStatusKind.error,
            message: '사진을 보내지 못했어요. 다시 시도해 주세요',
            actionLabel: '재시도',
            isActionLoading: true,
            actionLoadingLabel: '사진을 다시 보내고 있어요',
            onAction: () {},
          ),
          for (final kind in NestoryPhotoKind.values)
            NestoryPhotoPlaceholder(kind: kind),
        ];
        for (final component in cases) {
          await show(tester, component);
          await tester.pump();
          expect(
            tester.takeException(),
            isNull,
            reason: '${component.runtimeType} overflow',
          );
          for (final element in find.byType(RichText).evaluate()) {
            final paragraph = element.renderObject! as RenderParagraph;
            expect(
              paragraph.didExceedMaxLines,
              false,
              reason: 'Required text must not be truncated',
            );
            final left = paragraph.localToGlobal(Offset.zero).dx;
            expect(left, greaterThanOrEqualTo(0));
            expect(left + paragraph.size.width, lessThanOrEqualTo(width + 0.1));
          }
          for (final element in find.byType(TextButton).evaluate()) {
            final size = tester.getSize(find.byWidget(element.widget));
            expect(
              size.width,
              greaterThanOrEqualTo(NestorySizes.minTouchTarget),
            );
            expect(
              size.height,
              greaterThanOrEqualTo(NestorySizes.minTouchTarget),
            );
          }
          if (find.byType(TextField).evaluate().isNotEmpty) {
            expect(
              tester.getSize(find.byType(TextField)).height,
              greaterThanOrEqualTo(NestorySizes.inputMinHeight),
            );
          }
        }
      });
    }
  }

  testWidgets(
    'labels, contrast and touch targets satisfy Flutter accessibility guidelines',
    (tester) async {
      final controller = TextEditingController(text: '이름');
      addTearDown(controller.dispose);
      final cases = <Widget>[
        for (final variant in NestoryButtonVariant.values)
          NestoryButton(label: '행동', variant: variant, onPressed: () {}),
        NestoryTextInput(
          label: '이름',
          controller: controller,
          isRequired: true,
          errorText: '이름을 다시 확인해 주세요',
        ),
        for (final kind in NestoryStatusKind.values)
          NestoryStatusNotice(
            kind: kind,
            message: '상태와 해결 행동 안내',
            actionLabel: '확인',
            onAction: () {},
          ),
        const NestoryPhotoPlaceholder(kind: NestoryPhotoKind.item),
      ];
      for (final component in cases) {
        await show(tester, component);
        await tester.pump(const Duration(milliseconds: 200));
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
      }
    },
  );

  testWidgets('pressed secondary button retains readable label contrast', (
    tester,
  ) async {
    await show(
      tester,
      NestoryButton(
        label: '계속 작성',
        variant: NestoryButtonVariant.secondary,
        onPressed: () {},
      ),
    );
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('계속 작성')),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    final richText = tester.widget<RichText>(
      find.descendant(of: find.text('계속 작성'), matching: find.byType(RichText)),
    );
    final material = tester.widget<Material>(
      find.descendant(
        of: find.byType(TextButton),
        matching: find.byType(Material),
      ),
    );
    final foreground = richText.text.style!.color!.computeLuminance();
    final background = material.color!.computeLuminance();
    final ratio = (foreground > background)
        ? (foreground + 0.05) / (background + 0.05)
        : (background + 0.05) / (foreground + 0.05);
    expect(
      ratio,
      greaterThanOrEqualTo(4.5),
      reason: 'Approved button text contrast is 4.5 even for bold labels',
    );
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    await gesture.up();
  });

  testWidgets(
    'keyboard traverses active controls in order and activates actions',
    (tester) async {
      final first = FocusNode();
      final input = FocusNode();
      final retry = FocusNode();
      final controller = TextEditingController();
      addTearDown(first.dispose);
      addTearDown(input.dispose);
      addTearDown(retry.dispose);
      addTearDown(controller.dispose);
      var calls = 0;
      await show(
        tester,
        Column(
          children: [
            NestoryButton(
              label: '시작',
              focusNode: first,
              onPressed: () => calls++,
            ),
            NestoryTextInput(
              label: '이름',
              controller: controller,
              focusNode: input,
            ),
            NestoryButton(label: '비활성', enabled: false, onPressed: () {}),
            NestoryButton(label: '진행', isLoading: true, onPressed: () {}),
            NestoryButton(
              label: '다음',
              focusNode: retry,
              onPressed: () => calls++,
            ),
          ],
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(first.hasPrimaryFocus, true);
      expect(
        tester
            .widgetList<NestoryFocusOutline>(find.byType(NestoryFocusOutline))
            .where((w) => w.focused)
            .length,
        1,
      );
      final before = tester.getRect(find.byType(TextButton).first);
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(calls, 1);
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(input.hasPrimaryFocus, true);
      expect(
        tester
            .widgetList<NestoryFocusOutline>(find.byType(NestoryFocusOutline))
            .where((w) => w.focused)
            .length,
        1,
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(retry.hasPrimaryFocus, true);
      expect(
        tester.getRect(find.byType(TextButton).first),
        before,
        reason: 'Focus decoration must not move content',
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(calls, 2);
    },
    variant: TargetPlatformVariant({
      TargetPlatform.android,
      TargetPlatform.iOS,
    }),
  );

  testWidgets(
    'loading state responds to reduced motion without hiding its message',
    (tester) async {
      await show(
        tester,
        NestoryButton(
          label: '저장',
          isLoading: true,
          loadingLabel: '저장하고 있어요',
          onPressed: () {},
        ),
        reducedMotion: true,
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('저장하고 있어요'), findsOneWidget);
      expect(tester.getSemantics(find.byType(TextButton)).label, '저장하고 있어요');
    },
  );

  testWidgets(
    'scroll host keeps enlarged controls above safe area and keyboard',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(360, 800);
      tester.view.padding = const FakeViewPadding(top: 44, bottom: 34);
      tester.view.viewInsets = const FakeViewPadding(bottom: 300);
      tester.platformDispatcher.textScaleFactorTestValue = 3.2;
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetPadding);
      addTearDown(tester.view.resetViewInsets);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      final controller = TextEditingController();
      addTearDown(controller.dispose);
      await show(
        tester,
        Column(
          children: [
            NestoryTextInput(
              label: '이름',
              controller: controller,
              isRequired: true,
              errorText: '이름을 입력하고 다시 확인해 주세요',
            ),
            NestoryButton(label: '계속 작성', onPressed: () {}),
          ],
        ),
      );
      await tester.ensureVisible(find.byType(TextButton));
      await tester.pump();
      final rect = tester.getRect(find.byType(TextButton));
      expect(rect.top, greaterThanOrEqualTo(44));
      expect(rect.bottom, lessThanOrEqualTo(500));
      expect(tester.takeException(), isNull);
    },
  );
}
