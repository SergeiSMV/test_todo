import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/utils/base/base_local_data_source.dart';
import '../../../domain/models/task_model.dart';
import '../dao/task_dao.dart';
import '../database.dart';

/// Интерфейс для работы с локальными данными задач
abstract interface class ITaskLds {
  /// Добавление задачи
  Future<Either<Failure, void>> addTask(TaskModel model);

  /// Получение всех задач
  Future<Either<Failure, List<TaskModel>>> getMyTasks();

  /// Получение всех задач, назначенных на меня
  Future<Either<Failure, List<TaskModel>>> getAssignedTasks();

  /// Обновление задачи
  Future<Either<Failure, void>> updateTask(int id, bool status);
}

/// Реализация для работы с локальными данными задач
@LazySingleton(as: ITaskLds)
class TaskLds extends BaseLocalDataSource implements ITaskLds {
  TaskLds(this._db, super.logger);

  /// База данных
  final AppDatabase _db;

  /// DAO задач
  TaskDao get _taskDao => _db.taskDao;

  /// Добавление задачи
  @override
  Future<Either<Failure, void>> addTask(TaskModel model) => handleDBOperation(
    methodName: 'addTask',
    operation: () async => await _taskDao
        .addTask(model)
        .fold((failure) => Left(failure), (_) => Right(null)),
    failure: const DatabaseFailure(),
  );

  /// Получение всех задач, назначенных на меня
  @override
  Future<Either<Failure, List<TaskModel>>> getMyTasks() => handleDBOperation(
    methodName: 'getMyTasks',
    operation: () async => await _taskDao.getMyTasks().fold(
      (failure) => Left(failure),
      (tasks) => Right(tasks),
    ),
    failure: const DatabaseFailure(),
  );

  /// Получение всех задач, назначенных на других ответственных
  @override
  Future<Either<Failure, List<TaskModel>>> getAssignedTasks() =>
      handleDBOperation(
        methodName: 'getAssignedTasks',
        operation: () async => await _taskDao.getAssignedTasks().fold(
          (failure) => Left(failure),
          (tasks) => Right(tasks),
        ),
        failure: const DatabaseFailure(),
      );

  /// Обновление статуса задачи
  @override
  Future<Either<Failure, void>> updateTask(int id, bool status) =>
      handleDBOperation(
        methodName: 'updateTask',
        operation: () async => await _taskDao
            .updateTask(id, status)
            .fold((failure) => Left(failure), (_) => Right(null)),
        failure: const DatabaseFailure(),
      );
}
