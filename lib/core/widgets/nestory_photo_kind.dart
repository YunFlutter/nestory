import 'package:flutter/material.dart';

enum NestoryPhotoKind {
  space,
  container,
  item;

  String get label => switch (this) {
    space => '공간 사진 없음',
    container => '보관함 사진 없음',
    item => '물건 사진 없음',
  };

  IconData get icon => switch (this) {
    space => Icons.home_outlined,
    container => Icons.inventory_2_outlined,
    item => Icons.category_outlined,
  };
}
