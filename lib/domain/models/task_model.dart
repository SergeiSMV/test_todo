import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/domain/models/responsible_model.dart';

import '../../core/utils/enums/priority_enums.dart';
import '../../core/utils/gen/strings.g.dart';

/// Модель задачи
class TaskModel extends Equatable {
  const TaskModel({
    this.id,
    required this.description,
    required this.responsible,
    required this.status,
    required this.priority,
    required this.dueDate,
  });

  /// Идентификатор задачи
  final int? id;

  /// Описание задачи
  final String description;

  /// Ответственный за задачу
  final ResponsibleModel responsible;

  /// Статус задачи (true - активна, false - неактивна)
  final bool status;

  /// Приоритет задачи
  final PriorityEnum? priority;

  /// Дата исполнения задачи
  final DateTime? dueDate;

  /// Пустое состояние задачи (для формы)
  static TaskModel empty = TaskModel(
    id: null,
    description: '',
    responsible: ResponsibleModel.empty,
    status: false,
    priority: null,
    dueDate: null,
  );

  /// Флаг, указывающий, является ли форма задачи заполненной
  bool get isValid =>
      description.trim().isNotEmpty &&
      responsible.id != null &&
      priority != null &&
      dueDate != null;

  /// Отформатированная дата.
  String get formateDate => dueDate != null
      ? DateFormat('dd.MM.yyyy').format(dueDate!)
      : t.task_date.indefinitely_date;

  /// Создает копию модели с обновленными полями
  TaskModel copyWith({
    int? id,
    String? description,
    ResponsibleModel? responsible,
    bool? status,
    PriorityEnum? priority,
    DateTime? Function()? dueDate,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      responsible: responsible ?? this.responsible,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      dueDate: dueDate != null ? dueDate() : this.dueDate,
    );
  }

  @override
  List<Object?> get props => [
    id,
    description,
    responsible,
    status,
    priority,
    dueDate,
  ];
}
