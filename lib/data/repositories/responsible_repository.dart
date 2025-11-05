import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../core/utils/base/base_repository.dart';
import '../../domain/models/responsible_model.dart';
import '../../domain/repositories/i_responsible_repository.dart';
import '../local/data_sources/responsible_lds.dart';

@LazySingleton(as: IResponsibleRepository)
class ResponsibleRepository extends BaseRepository
    implements IResponsibleRepository {
  ResponsibleRepository(super._logger, this._lds);

  /// Локальные данные ответственных за задачи
  final IResponsibleLds _lds;

  /// Текущаяя ошибка, которая будет использоваться в методе execute
  final Failure _currentFailure = const ResponsibleRepositoryFailure();

  /// Возвращает текущую ошибку репозитория
  @override
  Failure get failure => _currentFailure;

  /// Получение всех ответственных за задачи
  @override
  Future<Either<Failure, List<ResponsibleModel>>> getResponsibles() => execute(
    methodName: 'getResponsibles',
    action: () async => await _lds.getResponsibles().fold(
      (failure) => throw failure,
      (responsibles) => responsibles,
    ),
  );

  /// Добавление ответственного за задачу
  @override
  Future<Either<Failure, String>> addResponsible(ResponsibleModel model) =>
      execute(
        methodName: 'addResponsible',
        action: () async => await _lds
            .addResponsible(model)
            .fold((failure) => throw failure, (success) => success),
      );

  /// Удаление ответственного за задачу
  @override
  Future<Either<Failure, String>> deleteResponsible(int id) => execute(
    methodName: 'deleteResponsible',
    action: () async => await _lds
        .deleteResponsible(id)
        .fold((failure) => throw failure, (success) => success),
  );
}
