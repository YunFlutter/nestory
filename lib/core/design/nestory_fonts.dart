import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract final class NestoryFonts {
  static const family = 'Noto Sans KR';
  static const asset = 'assets/fonts/NotoSansKR-Variable.ttf';
  static const licenseAsset = 'assets/fonts/OFL.txt';

  static void registerLicense() {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString(licenseAsset);
      yield LicenseEntryWithLineBreaks([family], license);
    });
  }
}
