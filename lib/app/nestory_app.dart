import 'package:flutter/material.dart';

import '../core/design/nestory_theme.dart';
import 'demo/counter_page.dart';

class NestoryApp extends StatelessWidget {
  const NestoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nestory',
      theme: NestoryTheme.light,
      themeMode: ThemeMode.light,
      home: const CounterPage(title: 'Nestory'),
    );
  }
}
