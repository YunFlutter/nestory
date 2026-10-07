import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nestory/core/design/nestory_fonts.dart';
import 'package:nestory/main.dart' as app;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('bundle declares Noto Sans KR at all three Figma weights', () async {
    final manifest = jsonDecode(
      await rootBundle.loadString('FontManifest.json'),
    ) as List<dynamic>;
    final family = manifest.where(
      (entry) => entry['family'] == NestoryFonts.family,
    );
    expect(family, hasLength(1));

    final fonts = family.single['fonts'] as List<dynamic>;
    expect(
      fonts.map((font) => font['weight']),
      unorderedEquals([400, 500, 700]),
    );
    expect(fonts.map((font) => font['asset']).toSet(), {NestoryFonts.asset});
    final bytes = await rootBundle.load(NestoryFonts.asset);
    expect(bytes.lengthInBytes, greaterThan(0));
  });

  test('font copyright and OFL license are available offline', () async {
    final license = await rootBundle.loadString(NestoryFonts.licenseAsset);
    expect(license, contains('SIL OPEN FONT LICENSE Version 1.1'));
    expect(license, contains('Copyright 2014-2021 Adobe'));
  });

  test('bundled font covers every modern Hangul syllable', () async {
    final data = await rootBundle.load(NestoryFonts.asset);
    final cmap = _tableOffset(data, 'cmap');
    int? format12;
    for (var i = 0; i < data.getUint16(cmap + 2); i++) {
      final offset = cmap + data.getUint32(cmap + 8 + i * 8);
      if (data.getUint16(offset) == 12) {
        format12 = offset;
        break;
      }
    }
    expect(format12, isNotNull, reason: 'Unicode glyph mapping is required');
    final offset = format12!;
    final groups = [
      for (var i = 0; i < data.getUint32(offset + 12); i++)
        (
          start: data.getUint32(offset + 16 + i * 12),
          end: data.getUint32(offset + 20 + i * 12),
          glyph: data.getUint32(offset + 24 + i * 12),
        ),
    ];
    for (var codePoint = 0xAC00; codePoint <= 0xD7A3; codePoint++) {
      expect(
        groups.any(
          (group) =>
              group.start <= codePoint &&
              codePoint <= group.end &&
              group.glyph + codePoint - group.start != 0,
        ),
        isTrue,
        reason: 'Missing Hangul syllable U+${codePoint.toRadixString(16)}',
      );
    }
  });

  test('variable font weight axis includes the Figma weights', () async {
    final data = await rootBundle.load(NestoryFonts.asset);
    final fvar = _tableOffset(data, 'fvar');
    final axis = fvar + data.getUint16(fvar + 4);
    expect(
      String.fromCharCodes(
        data.buffer.asUint8List(data.offsetInBytes + axis, 4),
      ),
      'wght',
    );
    final minimum = data.getInt32(axis + 4) / 65536;
    final maximum = data.getInt32(axis + 12) / 65536;
    for (final weight in [400, 500, 700]) {
      expect(weight, inInclusiveRange(minimum, maximum));
    }
  });

  testWidgets('app startup registers the bundled font license', (tester) async {
    LicenseRegistry.reset();
    app.main();
    await tester.pump();

    final licenses = await tester.runAsync(
      () => LicenseRegistry.licenses.toList(),
    );
    final fontLicenses = licenses!.where(
      (license) => license.packages.contains(NestoryFonts.family),
    );
    expect(fontLicenses, hasLength(1));
    expect(
      fontLicenses.single.paragraphs
          .map((paragraph) => paragraph.text)
          .join('\n'),
      contains('SIL OPEN FONT LICENSE'),
    );
  });
}

int _tableOffset(ByteData data, String tag) {
  for (var i = 0; i < data.getUint16(4); i++) {
    final offset = 12 + 16 * i;
    final actual = String.fromCharCodes(
      data.buffer.asUint8List(data.offsetInBytes + offset, 4),
    );
    if (actual == tag) {
      return data.getUint32(offset + 8);
    }
  }
  throw StateError('Font table $tag is missing');
}
