import 'package:equatable/equatable.dart';

import '../../../domain/models/task_model.dart';
import 'add_task_state.dart';
import 'task_validation_state.dart';

/// Объединённое состояние экрана добавления задачи
class NewTaskState extends Equatable {
  /// Состояние формы задачи
  final TaskModel form;

  /// Состояние валидации формы задачи
  final TaskValidationState validation;

  /// Состояние добавления задачи
  final AddTaskState addTaskState;

  const NewTaskState({
    required this.form,
    required this.validation,
    required this.addTaskState,
  });

  /// Флаг, указывающий, что форма валидна
  bool get isValid => form.isValid && validation.isValid;

  @override
  List<Object?> get props => [form, validation];
}
