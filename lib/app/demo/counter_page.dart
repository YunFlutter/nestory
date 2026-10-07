import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/design/nestory_spacing.dart';
import '../../core/design/nestory_typography.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    const titleStyle = NestoryTypography.title;
    final titleLineHeight =
        textScaler.scale(titleStyle.fontSize!) * titleStyle.height!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: math.max(
          kToolbarHeight,
          titleLineHeight + NestorySpacing.s16,
        ),
        title: Text(widget.title, textScaler: textScaler),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: NestorySpacing.screenHorizontalCompact,
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Text('버튼을 누른 횟수입니다', textAlign: TextAlign.center),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '횟수 추가',
        child: const Icon(Icons.add),
      ),
    );
  }
}
