import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/app/nestory_app.dart';

void main() {
  testWidgets('app uses the approved Figma palette', (tester) async {
    await tester.pumpWidget(const NestoryApp());

    final theme = Theme.of(tester.element(find.byType(Scaffold)));
    expect(theme.colorScheme.primary, const Color(0xFFC84B31));
    expect(theme.colorScheme.onPrimary, Colors.white);
    expect(theme.scaffoldBackgroundColor, Colors.white);
    expect(theme.appBarTheme.backgroundColor, Colors.white);
    expect(
      theme.floatingActionButtonTheme.backgroundColor,
      theme.colorScheme.primary,
    );
  });

  testWidgets('app inherits Figma Korean body and title styles', (
    tester,
  ) async {
    await tester.pumpWidget(const NestoryApp());

    final theme = Theme.of(tester.element(find.byType(Scaffold)));
    final body = theme.textTheme.bodyLarge!;
    expect(body.fontFamily, 'Noto Sans KR');
    expect(body.fontSize, 16);
    expect(body.height, 25 / 16);
    expect(body.fontWeight, FontWeight.w400);
    expect(body.color, const Color(0xFF292724));
    expect(theme.appBarTheme.titleTextStyle!.fontSize, 22);
    expect(theme.appBarTheme.titleTextStyle!.height, 32 / 22);
  });

  testWidgets('demo includes Korean text to check the app font', (
    tester,
  ) async {
    await tester.pumpWidget(const NestoryApp());
    expect(find.text('버튼을 누른 횟수입니다'), findsOneWidget);
    expect(find.byTooltip('횟수 추가'), findsOneWidget);
  });
}
