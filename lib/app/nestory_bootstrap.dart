import 'package:flutter/widgets.dart';

import '../core/design/nestory_fonts.dart';
import 'nestory_app.dart';

abstract final class NestoryBootstrap {
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    NestoryFonts.registerLicense();
    runApp(const NestoryApp());
  }
}
