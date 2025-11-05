import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/enums/priority_enums.dart';
import '../../../domain/models/responsible_model.dart';
import '../../../domain/models/task_model.dart';

/// Провайдер для управления состоянием формы задачи
final taskFormProvider = StateNotifierProvider<TaskFormNotifier, TaskModel>(
  (ref) => TaskFormNotifier(),
);

/// Notifier для управления состоянием формы задачи
class TaskFormNotifier extends StateNotifier<TaskModel> {
  TaskFormNotifier() : super(TaskModel.empty);

  /// Обновляет описание задачи
  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  /// Обновляет ответственного за задачу
  void updateResponsible(ResponsibleModel responsible) {
    state = state.copyWith(responsible: responsible);
  }

  /// Обновляет приоритет задачи
  void updatePriority(PriorityEnum priority) {
    state = state.copyWith(priority: priority);
  }

  /// Обновляет дату исполнения задачи
  void updateDueDate(DateTime? dueDate) {
    state = state.copyWith(dueDate: () => dueDate);
  }

  /// Очищает форму задачи
  void clearForm() {
    state = TaskModel.empty;
  }
}
