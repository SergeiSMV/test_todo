import 'package:equatable/equatable.dart';

import '../../../core/utils/enums/priority_enums.dart';

/// Модель фильтра задач
class TaskFilter extends Equatable {
  const TaskFilter({this.priority, this.status});

  /// Фильтр по приоритету (null = все приоритеты)
  final PriorityEnum? priority;

  /// Фильтр по статусу (null = все статусы, true = активные, false = неактивные)
  final bool? status;

  /// Фильтр по умолчанию (без фильтров)
  const TaskFilter.empty() : priority = null, status = null;

  /// Проверяет, применены ли какие-либо фильтры
  bool get hasFilters => priority != null || status != null;

  /// Создает копию фильтра с обновленными полями
  TaskFilter copyWith({
    PriorityEnum? priority,
    bool? status,
    bool clearPriority = false,
    bool clearStatus = false,
  }) {
    return TaskFilter(
      priority: clearPriority ? null : (priority ?? this.priority),
      status: clearStatus ? null : (status ?? this.status),
    );
  }

  /// Сбрасывает все фильтры
  TaskFilter clear() => const TaskFilter();

  @override
  List<Object?> get props => [priority, status];
}
