import 'package:either_dart/either.dart';

import '../../core/error/failures.dart';
import '../models/task_model.dart';

/// Репозиторий для работы с задачами
abstract interface class ITasksRepository {
  /// Добавление задачи
  Future<Either<Failure, void>> addTask(TaskModel model);

  /// Получение всех задач
  Future<Either<Failure, List<TaskModel>>> getMyTasks();

  /// Получение всех задач, назначенных на меня
  Future<Either<Failure, List<TaskModel>>> getAssignedTasks();

  /// Обновление задачи
  Future<Either<Failure, void>> updateTask(int id, bool status);
}
