import 'package:flutter/material.dart';

import '../design/nestory_colors.dart';

/// Presentation roles, not a model of server or synchronization state.
enum NestoryStatusKind {
  success,
  waiting,
  info,
  error,
  conflict,
  loading;

  String get label => switch (this) {
    success => '완료',
    waiting => '대기',
    info => '안내',
    error => '오류',
    conflict => '충돌',
    loading => '진행 중',
  };

  Color get color => switch (this) {
    success => NestoryColors.success,
    waiting => NestoryColors.warning,
    info || loading => NestoryColors.info,
    error || conflict => NestoryColors.error,
  };

  IconData get icon => switch (this) {
    success => Icons.check_circle_outline,
    waiting => Icons.schedule_outlined,
    info => Icons.info_outline,
    error => Icons.error_outline,
    conflict => Icons.sync_problem_outlined,
    loading => Icons.hourglass_top_outlined,
  };
}
