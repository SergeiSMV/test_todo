import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/domain/models/task_model.dart';
import '../../../core/di/di.dart';
import '../../../domain/repositories/i_tasks_repository.dart';
import '../../states/new_task_state/add_task_state.dart';

/// Провайдер состояния для списка ответственных
final addTaskProvider = StateNotifierProvider<AddTaskNotifier, AddTaskState>(
  (ref) => AddTaskNotifier(getIt<ITasksRepository>()),
);

/// Notifier для управления состоянием списка ответственных
class AddTaskNotifier extends StateNotifier<AddTaskState> {
  AddTaskNotifier(this._tasksRepository) : super(const AddTaskInitial());

  /// Репозиторий для работы с задачами
  final ITasksRepository _tasksRepository;

  /// Обрабатываем результат
  Future<void> addTask(TaskModel task) async {
    state = const AddTaskLoading();

    /// логика добавления задачи
    final result = await _tasksRepository.addTask(task);

    /// Обрабатываем результат
    result.fold(
      (failure) => state = AddTaskError(),
      (_) => state = AddTaskSuccess(),
    );
  }
}
