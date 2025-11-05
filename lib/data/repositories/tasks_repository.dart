import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/domain/models/task_model.dart';

import '../../core/error/failures.dart';
import '../../core/utils/base/base_repository.dart';
import '../../domain/repositories/i_tasks_repository.dart';
import '../local/data_sources/task_lds.dart';

@LazySingleton(as: ITasksRepository)
class TasksRepository extends BaseRepository implements ITasksRepository {
  TasksRepository(super._logger, this._lds);

  /// Локальные данные ответственных за задачи
  final ITaskLds _lds;

  /// Текущаяя ошибка, которая будет использоваться в методе execute
  final Failure _currentFailure = const TasksRepositoryFailure();

  /// Возвращает текущую ошибку репозитория
  @override
  Failure get failure => _currentFailure;

  /// Добавление задачи
  @override
  Future<Either<Failure, void>> addTask(TaskModel model) => execute(
    methodName: 'addTask',
    action: () async => await _lds
        .addTask(model)
        .fold((failure) => throw failure, (success) => success),
  );

  /// Получение всех задач, назначенных на меня
  @override
  Future<Either<Failure, List<TaskModel>>> getMyTasks() => execute(
    methodName: 'getMyTasks',
    action: () async => await _lds.getMyTasks().fold(
      (failure) => throw failure,
      (tasks) => tasks,
    ),
  );

  /// Получение всех задач, назначенных на других ответственных
  @override
  Future<Either<Failure, List<TaskModel>>> getAssignedTasks() => execute(
    methodName: 'getAssignedTasks',
    action: () async => await _lds.getAssignedTasks().fold(
      (failure) => throw failure,
      (tasks) => tasks,
    ),
  );

  /// Обновление статуса задачи
  @override
  Future<Either<Failure, void>> updateTask(int id, bool status) => execute(
    methodName: 'updateTask',
    action: () async => await _lds
        .updateTask(id, status)
        .fold((failure) => throw failure, (success) => success),
  );
}
