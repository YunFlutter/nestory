import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/app/nestory_app.dart';
import 'package:nestory/core/design/nestory_fonts.dart';
import 'package:nestory/core/design/nestory_sizes.dart';
import 'package:nestory/core/design/nestory_typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final loader = FontLoader(NestoryFonts.family)
      ..addFont(rootBundle.load(NestoryFonts.asset));
    await loader.load();
  });

  for (final width in [360.0, 390.0, 430.0]) {
    for (final scale in [1.0, 3.2]) {
      testWidgets('Korean demo fits width $width at text scale $scale', (
        tester,
      ) async {
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = Size(width, 800);
        tester.platformDispatcher.textScaleFactorTestValue = scale;
        addTearDown(tester.view.resetDevicePixelRatio);
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

        await tester.pumpWidget(const NestoryApp());
        final title = tester.getRect(find.text('Nestory'));
        final titleStyle = NestoryTypography.title;
        expect(
          title.height,
          greaterThanOrEqualTo(
            titleStyle.fontSize! * titleStyle.height! * scale - 1,
          ),
          reason: 'The app bar must allow the enlarged title to grow',
        );
        final body = tester.getRect(find.text('버튼을 누른 횟수입니다'));
        expect(body.left, greaterThanOrEqualTo(0));
        expect(body.right, lessThanOrEqualTo(width));
        expect(body.bottom, lessThan(800));

        final button = find.byTooltip('횟수 추가');
        final size = tester.getSize(button);
        expect(size.width, greaterThanOrEqualTo(NestorySizes.minTouchTarget));
        expect(size.height, greaterThanOrEqualTo(NestorySizes.minTouchTarget));
        await tester.tap(button);
        await tester.pump();
        expect(find.text('1'), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
