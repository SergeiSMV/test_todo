import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/di.dart';
import '../../core/utils/enums/priority_enums.dart';
import '../../domain/repositories/i_tasks_repository.dart';
import '../states/assigned_tasks_state.dart';
import '../../domain/models/task_filter.dart';

/// Provider для фильтра задач
final assignedTasksFilterProvider =
    StateNotifierProvider<TaskFilterNotifier, TaskFilter>(
      (ref) => TaskFilterNotifier(),
    );

/// Provider для отфильтрованных задач
final filteredAssignedTasksProvider = Provider<AssignedTasksState>((ref) {
  final filter = ref.watch(assignedTasksFilterProvider);
  final tasksState = ref.watch(assignedTasksProvider);

  if (tasksState is! AssignedTasksSuccess) {
    return tasksState;
  }

  final tasks = tasksState.tasks;
  var filteredTasks = tasks;

  // Применяем фильтр по приоритету
  if (filter.priority != null) {
    filteredTasks = filteredTasks
        .where((task) => task.priority == filter.priority)
        .toList();
  }

  // Применяем фильтр по статусу
  if (filter.status != null) {
    filteredTasks = filteredTasks
        .where((task) => task.status == filter.status)
        .toList();
  }

  if (filteredTasks.isEmpty) {
    return const AssignedTasksEmpty();
  }

  return AssignedTasksSuccess(filteredTasks);
});

final assignedTasksProvider =
    StateNotifierProvider<AssignedTasksNotifier, AssignedTasksState>(
      (ref) => AssignedTasksNotifier(getIt<ITasksRepository>()),
    );

class AssignedTasksNotifier extends StateNotifier<AssignedTasksState> {
  AssignedTasksNotifier(this._taskRepository)
    : super(const AssignedTasksLoading());

  /// Репозиторий задач
  final ITasksRepository _taskRepository;

  /// Получает список задач
  Future<void> fetchAssignedTasks() async {
    /// Задержка для имитации загрузки
    await Future.delayed(const Duration(seconds: 1));

    final result = await _taskRepository.getAssignedTasks();

    /// Обрабатываем результат
    result.fold(
      (failure) => state = AssignedTasksError(),
      (tasks) => state = tasks.isEmpty
          ? const AssignedTasksEmpty()
          : AssignedTasksSuccess(tasks),
    );
  }

  /// Обновляет статус задачи
  Future<void> updateTask(int id, bool status) async {
    final result = await _taskRepository.updateTask(id, status);

    result.fold(
      (failure) => state = AssignedTasksError(),
      (_) => fetchAssignedTasks(),
    );
  }
}

/// Notifier для управления фильтром задач
class TaskFilterNotifier extends StateNotifier<TaskFilter> {
  TaskFilterNotifier() : super(const TaskFilter.empty());

  /// Устанавливает фильтр по приоритету
  void setPriority(PriorityEnum? priority) {
    state = state.copyWith(priority: priority, clearPriority: priority == null);
  }

  /// Устанавливает фильтр по статусу
  void setStatus(bool? status) {
    state = state.copyWith(status: status, clearStatus: status == null);
  }

  /// Сбрасывает все фильтры
  void clearFilters() {
    state = state.clear();
  }
}
