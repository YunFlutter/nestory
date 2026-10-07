import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_theme.dart';
import 'package:nestory/core/widgets/nestory_photo_placeholder.dart';
import 'package:nestory/core/widgets/nestory_photo_kind.dart';

void main() {
  for (final kind in NestoryPhotoKind.values) {
    testWidgets(
      '$kind explains the missing photo visibly and to assistive technology',
      (tester) async {
        final handle = tester.ensureSemantics();
        addTearDown(handle.dispose);
        await tester.pumpWidget(
          MaterialApp(
            theme: NestoryTheme.light,
            home: Scaffold(body: NestoryPhotoPlaceholder(kind: kind)),
          ),
        );
        final label = switch (kind) {
          NestoryPhotoKind.space => '공간 사진 없음',
          NestoryPhotoKind.container => '보관함 사진 없음',
          NestoryPhotoKind.item => '물건 사진 없음',
        };
        expect(find.text(label), findsOneWidget);
        expect(
          tester.getSemantics(find.byType(NestoryPhotoPlaceholder)),
          matchesSemantics(label: label, isImage: true),
        );
      },
    );
  }
}
