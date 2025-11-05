import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/utils/base/base_local_data_source.dart';
import '../../../domain/models/responsible_model.dart';
import '../dao/responsible_dao.dart';
import '../database.dart';

/// Интерфейс для работы с локальными данными ответственных за задачи
abstract interface class IResponsibleLds {
  /// Получение всех ответственных
  Future<Either<Failure, List<ResponsibleModel>>> getResponsibles();

  /// Добавление ответственного

  Future<Either<Failure, String>> addResponsible(ResponsibleModel model);

  /// Удаление ответственного
  Future<Either<Failure, String>> deleteResponsible(int id);
}

/// Реализация для работы с локальными данными ответственных за задачи
@LazySingleton(as: IResponsibleLds)
class ResponsibleLds extends BaseLocalDataSource implements IResponsibleLds {
  ResponsibleLds(this._db, super.logger);

  /// База данных
  final AppDatabase _db;

  /// DAO ответственных за задачи
  ResponsibleDao get _responsibleDao => _db.responsibleDao;

  /// Получение всех ответственных за задачи
  @override
  Future<Either<Failure, List<ResponsibleModel>>> getResponsibles() =>
      handleDBOperation(
        methodName: 'getResponsibles',
        operation: () async => await _responsibleDao.getResponsibles().fold(
          (failure) => Left(failure),
          (responsibles) => Right(responsibles),
        ),
        failure: const DatabaseFailure(),
      );

  /// Добавление ответственного за задачу
  @override
  Future<Either<Failure, String>> addResponsible(ResponsibleModel model) =>
      handleDBOperation(
        methodName: 'addResponsible',
        operation: () async => await _responsibleDao
            .addResponsible(model)
            .fold((failure) => Left(failure), (_) => Right('success')),
        failure: const DatabaseFailure(),
      );

  /// Удаление ответственного за задачу
  @override
  Future<Either<Failure, String>> deleteResponsible(int id) =>
      handleDBOperation(
        methodName: 'deleteResponsible',
        operation: () async => await _responsibleDao
            .deleteResponsible(id)
            .fold((failure) => Left(failure), (_) => Right('success')),
        failure: const DatabaseFailure(),
      );
}
