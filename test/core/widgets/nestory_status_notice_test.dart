import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_theme.dart';
import 'package:nestory/core/widgets/nestory_status_notice.dart';
import 'package:nestory/core/widgets/nestory_status_kind.dart';

void main() {
  Future<void> show(WidgetTester tester, Widget child) => tester.pumpWidget(
    MaterialApp(
      theme: NestoryTheme.light,
      home: Scaffold(body: child),
    ),
  );
  for (final kind in NestoryStatusKind.values) {
    testWidgets(
      '$kind includes a visible meaning, message and optional action',
      (tester) async {
        final handle = tester.ensureSemantics();
        addTearDown(handle.dispose);
        var calls = 0;
        await show(
          tester,
          NestoryStatusNotice(
            kind: kind,
            message: '현재 상태를 확인해 주세요',
            actionLabel: '확인',
            onAction: () => calls++,
          ),
        );
        expect(find.text('현재 상태를 확인해 주세요'), findsOneWidget);
        final label = switch (kind) {
          NestoryStatusKind.success => '완료',
          NestoryStatusKind.waiting => '대기',
          NestoryStatusKind.info => '안내',
          NestoryStatusKind.error => '오류',
          NestoryStatusKind.conflict => '충돌',
          NestoryStatusKind.loading => '진행 중',
        };
        expect(find.text(label), findsOneWidget);
        expect(find.bySemanticsLabel('$label. 현재 상태를 확인해 주세요'), findsOneWidget);
        await tester.tap(find.text('확인'));
        expect(calls, 1);
      },
    );
  }

  testWidgets('notice forwards external retry progress and disabled state', (
    tester,
  ) async {
    var calls = 0;
    for (final loading in [true, false]) {
      await show(
        tester,
        NestoryStatusNotice(
          kind: NestoryStatusKind.error,
          message: '사진을 보내지 못했어요. 다시 시도해 주세요',
          actionLabel: '재시도',
          actionLoadingLabel: '다시 시도하고 있어요',
          actionEnabled: loading,
          isActionLoading: loading,
          onAction: () => calls++,
        ),
      );
      await tester.tap(find.byType(TextButton));
      await tester.pump();
      expect(calls, 0);
    }
  });
}
