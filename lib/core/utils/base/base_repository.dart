import 'package:either_dart/either.dart';

import '../../error/failures.dart';
import '../../logger/talker_logger.dart';

/// Базовый класс для всех репозиториев. Предоставляет методы для выполнения
/// асинхронных действий и логирования ошибок
abstract class BaseRepository {
  const BaseRepository(this._logger);

  /// Логгер для записи сообщений об ошибках.
  final IAppLogger _logger;

  /// Возвращает объект ошибки, который будет возвращен в случае ошибки
  Failure get failure;

  /// Выполняет асинхронное действие и возвращает результат в виде [Either]
  ///
  /// - [action] - асинхронное действие
  ///
  /// - [failure] - ошибка, которая будет возвращена в случае ошибки
  ///
  /// Возвращает:
  /// - [Right<T>] если действие выполнено успешно
  /// - [Left<Failure>] если произошла ошибка
  Future<Either<Failure, T>> execute<T>({
    required Future<T> Function() action,
    String? methodName,
  }) async {
    try {
      final result = await action();
      return Right(result);
    } on Exception catch (e, st) {
      if (e is Failure) {
        return Left(_logError(e, e, st, methodName));
      }
      return Left(_logError(failure, e, st, methodName));
    }
  }

  /// Логирует ошибку и возвращает ее
  Failure _logError(Failure f, Object e, StackTrace? st, String? methodName) {
    final msg = _buildMessage(f, methodName);
    _logger.handle(e, st, msg);
    return f;
  }

  /// Строит сообщение об ошибке
  /// Возвращает строку с именем класса и сообщением об ошибке
  /// Если сообщение об ошибке отсутствует, возвращает только имя класса
  /// Пример:
  ///
  ///   📌 ERROR DETAILS
  /// ┌ Location: BaseRepository :: method
  /// ├ Type:     Failure
  /// └ Message:  error message
  ///
  String _buildMessage(Failure f, String? methodName) {
    // Цвета
    const red = '\x1B[31m';
    const yellow = '\x1B[33m';
    const blue = '\x1B[34m';
    const magenta = '\x1B[35m';
    const cyan = '\x1B[36m';
    const reset = '\x1B[0m';

    // Стили
    const bold = '\x1B[1m';
    const underline = '\x1B[4m';

    final where = runtimeType.toString();
    final who = f.runtimeType.toString();
    final errorMessage = f.error;
    final method = methodName != null ? ' :: $methodName' : '';

    return '''
      $underline$bold$red📌 ERROR DETAILS$reset
      $bold$yellow┌ Location:$reset $blue$where$cyan$method$reset
      $bold$yellow├ Type:$reset     $red$who$reset
      $bold$yellow└ Message:$reset  $magenta$errorMessage$reset
    ''';
  }
}
