import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../gen/strings.g.dart';

/// Перечисление приоритетов задач
enum PriorityEnum {
  /// Низкий приоритет
  low,

  /// Средний приоритет
  medium,

  /// Высокий приоритет
  high;

  /// Название приоритета
  String get name => switch (this) {
    PriorityEnum.low => t.task_priority.low,
    PriorityEnum.medium => t.task_priority.medium,
    PriorityEnum.high => t.task_priority.high,
  };

  /// Получение приоритета по названию
  static PriorityEnum getPriorityByName(String name) => switch (name) {
    'low' => PriorityEnum.low,
    'medium' => PriorityEnum.medium,
    'high' => PriorityEnum.high,
    _ => throw Exception('Invalid priority name: $name'),
  };

  /// Название приоритета для API
  String get apiName => switch (this) {
    PriorityEnum.low => 'low',
    PriorityEnum.medium => 'medium',
    PriorityEnum.high => 'high',
  };

  /// Цвет приоритета
  Color getColor(BuildContext context) => switch (this) {
    PriorityEnum.low => context.colors.mainColors.priorityColors.low,
    PriorityEnum.medium => context.colors.mainColors.priorityColors.medium,
    PriorityEnum.high => context.colors.mainColors.priorityColors.high,
  };
}
