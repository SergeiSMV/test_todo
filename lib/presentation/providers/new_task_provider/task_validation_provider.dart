import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/gen/strings.g.dart';
import '../../states/new_task_state/task_validation_state.dart';

/// Провайдер для управления состоянием валидации задачи.
final taskValidationProvider =
    StateNotifierProvider<TaskValidationNotifier, TaskValidationState>(
      (ref) => TaskValidationNotifier(),
    );

/// Notifier для управления состоянием валидации задачи
class TaskValidationNotifier extends StateNotifier<TaskValidationState> {
  TaskValidationNotifier() : super(TaskValidationState.empty);

  /// Проверяет корректность описания задачи
  void validateDescription(String description) {
    if (description.trim().isNotEmpty && description.trim().length < 10) {
      state = state.copyWith(
        descriptionError: () => t.validation_errors.description_error,
      );
    } else {
      state = state.copyWith(descriptionError: () => null);
    }
  }

  /// Проверяет корректность даты выполнения задачи
  /// Дата должна быть не раньше текущей даты
  void validateDueDate(DateTime? dueDate) {
    if (dueDate == null) {
      state = state.copyWith(
        dueDateError: () => t.validation_errors.due_date_error,
      );
      return;
    }

    // Получаем текущую дату (нормализуем, убираем время)
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Нормализуем выбранную дату (убираем время)
    final selectedDate = DateTime(dueDate.year, dueDate.month, dueDate.day);

    // Проверяем, что дата не раньше текущей даты
    if (selectedDate.isBefore(today)) {
      state = state.copyWith(
        dueDateError: () => t.validation_errors.due_date_error,
      );
    } else {
      state = state.copyWith(dueDateError: () => null);
    }
  }

  /// Проверяет все поля формы.
  bool validateAll() => state.isValid;
}
