import 'package:flutter/material.dart';

/// Основные цвета приложения
abstract class MainColors {
  const MainColors({
    required this.primary,
    required this.primaryLight,
    required this.secondary,
    required this.transparent,
    required this.error,
    required this.white,
    required this.bottomSheetBlackout,
    required this.shadow,
    required this.priorityColors,
  });

  /// Основной цвет приложения
  final Color primary;

  /// Основной светлый цвет приложения
  final Color primaryLight;

  /// Вторичный цвет приложения
  final Color secondary;

  /// Прозрачный цвет
  final Color transparent;

  /// Цвет ошибки
  final Color error;

  /// Белый цвет
  final Color white;

  /// Цвет затемнения модального окна
  final Color bottomSheetBlackout;

  /// Цвет тени
  final Color shadow;

  /// Цвета приоритетов задач
  final ({Color low, Color medium, Color high}) priorityColors;
}
