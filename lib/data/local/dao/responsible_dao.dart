import 'package:drift/drift.dart';
import 'package:either_dart/either.dart';
import 'package:todo_list/data/mappers/responsible_mapper.dart';

import '../../../core/error/failures.dart';
import '../../../domain/models/responsible_model.dart';
import '../database.dart';
import '../tables/responsible_table.dart';

part 'responsible_dao.g.dart';

/// DAO для работы с таблицей данных профиля пользователя
@DriftAccessor(tables: [ResponsibleTable])
class ResponsibleDao extends DatabaseAccessor<AppDatabase>
    with _$ResponsibleDaoMixin {
  ResponsibleDao(super.attachedDatabase);

  /// Проверяет, существует ли пользователь с данным именем
  Future<bool> existsByName(String name) async {
    final query = select(responsibleTable)
      ..where((tbl) => tbl.name.equals(name))
      ..where((tbl) => tbl.status.equals('active')); // только активные

    final result = await query.getSingleOrNull();
    return result != null;
  }

  /// Инициализация дефолтного пользователя
  Future<void> initDefaultUser() async {
    const defaultName = 'пользователь';
    final exists = await existsByName(defaultName);

    if (!exists) {
      final model = ResponsibleModel(name: defaultName, phone: '');
      await addResponsible(model);
    }
  }

  /// Добавление ответственного
  Future<Either<Failure, void>> addResponsible(ResponsibleModel model) async {
    try {
      final data = model.toResponsibleTableCompanion();
      await into(responsibleTable).insertOnConflictUpdate(data);
      return Right(null);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  /// Получить ответственного по id
  Future<Either<Failure, ResponsibleModel>> getResponsibleById(int id) async {
    try {
      final query = select(responsibleTable)..where((tbl) => tbl.id.equals(id));
      final result = await query.getSingleOrNull();
      return Right(result?.toResponsibleModel() ?? ResponsibleModel.empty);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  /// Получение всех ответственных
  Future<Either<Failure, List<ResponsibleModel>>> getResponsibles() async {
    try {
      final query = select(responsibleTable)
        ..where((tbl) => tbl.status.equals('active'));

      final result = await query.get();

      return Right(result.map((row) => row.toResponsibleModel()).toList());
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  /// Помечает ответственного как неактивного (soft delete)
  Future<Either<Failure, void>> deleteResponsible(int id) async {
    try {
      await (update(responsibleTable)..where((tbl) => tbl.id.equals(id))).write(
        const ResponsibleTableCompanion(status: Value('inactive')),
      );
      return Right(null);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }
}
