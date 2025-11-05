import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/di.dart';
import '../../core/utils/enums/priority_enums.dart';
import '../../domain/repositories/i_tasks_repository.dart';
import '../states/my_tasks_state.dart';
import '../../domain/models/task_filter.dart';

/// Provider для фильтра задач
final taskFilterProvider =
    StateNotifierProvider<TaskFilterNotifier, TaskFilter>(
      (ref) => TaskFilterNotifier(),
    );

/// Provider для отфильтрованных задач
final filteredMyTasksProvider = Provider<MyTasksState>((ref) {
  final filter = ref.watch(taskFilterProvider);
  final tasksState = ref.watch(myTasksProvider);

  if (tasksState is! MyTasksSuccess) {
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
    return const MyTasksEmpty();
  }

  return MyTasksSuccess(filteredTasks);
});

final myTasksProvider = StateNotifierProvider<MyTasksNotifier, MyTasksState>(
  (ref) => MyTasksNotifier(getIt<ITasksRepository>()),
);

class MyTasksNotifier extends StateNotifier<MyTasksState> {
  MyTasksNotifier(this._taskRepository) : super(const MyTasksLoading());

  /// Репозиторий задач
  final ITasksRepository _taskRepository;

  /// Получает список задач
  /// Получает список ответственных
  Future<void> fetchMyTasks() async {
    /// Задержка для имитации загрузки
    await Future.delayed(const Duration(seconds: 1));

    final result = await _taskRepository.getMyTasks();

    /// Обрабатываем результат
    result.fold(
      (failure) => state = MyTasksError(),
      (tasks) =>
          state = tasks.isEmpty ? const MyTasksEmpty() : MyTasksSuccess(tasks),
    );
  }

  /// Обновляет статус задачи
  Future<void> updateTask(int id, bool status) async {
    final result = await _taskRepository.updateTask(id, status);

    result.fold((failure) => state = MyTasksError(), (_) => fetchMyTasks());
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
