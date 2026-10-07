import 'package:flutter/material.dart';

import 'demo/counter_page.dart';

class NestoryApp extends StatelessWidget {
  const NestoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nestory',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const CounterPage(title: 'Nestory'),
    );
  }
}
