import 'package:flutter/material.dart';

import 'main_colors.dart';

/// Цвета приложения, используемые в макетах
abstract class BaseColors extends ThemeExtension<BaseColors> {
  const BaseColors({required this.mainColors});

  /// Основные цвета приложения
  final MainColors mainColors;
}
