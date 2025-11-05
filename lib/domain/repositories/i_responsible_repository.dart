import 'package:either_dart/either.dart';

import '../../core/error/failures.dart';
import '../models/responsible_model.dart';

/// Репозиторий для работы с ответственными за задачи
abstract interface class IResponsibleRepository {
  /// Добавление ответственного
  Future<Either<Failure, void>> addResponsible(ResponsibleModel model);

  /// Получение всех ответственных
  Future<Either<Failure, List<ResponsibleModel>>> getResponsibles();

  /// Удаление ответственного
  Future<Either<Failure, void>> deleteResponsible(int id);
}
