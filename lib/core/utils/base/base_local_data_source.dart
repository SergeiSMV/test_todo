import 'package:talker_flutter/talker_flutter.dart';
import 'package:todo_list/core/utils/extensions/model_logger_extension.dart';

import '../../error/failures.dart';
import '../../logger/talker_logger.dart';

/// Базовый класс для всех локальных источников данных.
///
/// Предоставляет метод для выполнения операций с базой данных.
abstract class BaseLocalDataSource {
  const BaseLocalDataSource(this.logger);

  final IAppLogger logger;

  /// Выполняет операцию с базой данных и логирует результат.
  ///
  /// - [operation] - функция, которая выполняет операцию с базой данных.
  /// - [methodName] - имя метода, который вызывается.
  /// - [shouldLog] - флаг, определяющий, нужно ли логировать результат.
  Future<T> handleDBOperation<T>({
    required String methodName,
    required Future<T> Function() operation,
    required Failure failure,
    bool shouldLog = true,
  }) async {
    try {
      final result = await operation();

      if (shouldLog) {
        // Если результат - Either, извлекаем значение для логирования
        dynamic logData = result;
        if (result != null) {
          try {
            // Проверяем, является ли результат Either через проверку типа
            final resultType = result.runtimeType.toString();
            if (resultType.startsWith('Right') ||
                resultType.startsWith('Left')) {
              // Это Either, извлекаем значение через fold
              logData = (result as dynamic).fold(
                (failure) =>
                    'Error: ${(failure as dynamic).error ?? failure.toString()}',
                (value) => value,
              );
            }
          } catch (e) {
            // Если не Either или произошла ошибка, используем исходный результат
            logData = result;
          }
        }

        // Логируем только если logData не null и не является Either
        String logMessage;
        if (logData == null) {
          logMessage = '$runtimeType ::: $methodName ::: null result';
        } else {
          try {
            logMessage = (logData as Object).toJsonLog(
              '$runtimeType ::: $methodName',
            );
          } catch (e) {
            // Если toJsonLog не доступен, используем toString
            logMessage =
                '$runtimeType ::: $methodName ::: ${logData.toString()}';
          }
        }

        logger.log(level: LogLevel.info, message: logMessage);
      } else {
        logger.log(
          level: LogLevel.info,
          message: '$runtimeType ::: $methodName',
        );
      }
      return result;
    } on Exception catch (e, trace) {
      logger.handle(e, trace, '$runtimeType :: $methodName');
      throw failure;
    }
  }
}
