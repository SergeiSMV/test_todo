import 'package:drift/drift.dart';
import 'package:either_dart/either.dart';
import 'package:todo_list/data/mappers/responsible_mapper.dart';
import 'package:todo_list/data/mappers/task_mapper.dart';

import '../../../core/error/failures.dart';
import '../../../domain/models/task_model.dart';
import '../database.dart';
import '../tables/responsible_table.dart';
import '../tables/task_table.dart';

part 'task_dao.g.dart';

/// DAO для работы с таблицей данных задач
@DriftAccessor(tables: [TaskTable, ResponsibleTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.attachedDatabase);

  /// Добавление задачи
  Future<Either<Failure, void>> addTask(TaskModel model) async {
    try {
      final data = model.toTaskTableCompanion();
      await into(taskTable).insertOnConflictUpdate(data);
      return Right(null);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  /// Получение всех задач назначенных на меня (пользователя)
  Future<Either<Failure, List<TaskModel>>> getMyTasks() async {
    try {
      final query = select(taskTable).join([
        innerJoin(
          responsibleTable,
          responsibleTable.id.equalsExp(taskTable.responsibleId),
        ),
      ])..where(taskTable.responsibleId.equals(1));
      final result = await query.get();
      return Right(
        result
            .map(
              (row) => row
                  .readTable(taskTable)
                  .toTaskModel(
                    row.readTable(responsibleTable).toResponsibleModel(),
                  ),
            )
            .toList(),
      );
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  /// Получение всех задач назначенных на других ответственных
  Future<Either<Failure, List<TaskModel>>> getAssignedTasks() async {
    try {
      final query = select(taskTable).join([
        innerJoin(
          responsibleTable,
          responsibleTable.id.equalsExp(taskTable.responsibleId),
        ),
      ])..where(taskTable.responsibleId.isNotValue(1));
      final result = await query.get();
      return Right(
        result
            .map(
              (row) => row
                  .readTable(taskTable)
                  .toTaskModel(
                    row.readTable(responsibleTable).toResponsibleModel(),
                  ),
            )
            .toList(),
      );
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  /// Обновление задачи
  Future<Either<Failure, void>> updateTask(int id, bool status) async {
    try {
      await (update(taskTable)..where((t) => t.id.equals(id))).write(
        TaskTableCompanion(status: Value(status)),
      );
      return Right(null);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }
}
