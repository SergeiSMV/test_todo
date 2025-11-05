import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../di/di.dart';

/// Абстракция логгера приложения
abstract interface class IAppLogger {
  void log({
    required LogLevel level,
    required String message,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Логирование ошибки
  void handle(Object error, [StackTrace? stackTrace, String msg]);

  /// Логирование пользовательского лога
  void customLog(TalkerLog log);

  /// Доступ к экземпляру Talker для интеграций (Riverpod, UI)
  Talker get talker;
}

/// Реализация логгера приложения на основе [Talker]
@LazySingleton(as: IAppLogger)
class AppLogger implements IAppLogger {
  AppLogger({required Talker talker}) : _talker = talker;

  /// Плагин для работы с логами
  final Talker _talker;

  @override
  Talker get talker => _talker;

  @override
  void log({
    required LogLevel level,
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) => switch (level) {
    LogLevel.debug => _talker.debug(message, error, stackTrace),
    LogLevel.info => _talker.info(message, error, stackTrace),
    LogLevel.warning => _talker.warning(message, error, stackTrace),
    LogLevel.error => _talker.error(message, error, stackTrace),
    LogLevel.critical => _talker.critical(message, error, stackTrace),
    LogLevel.verbose => _talker.verbose(message, error, stackTrace),
  };

  /// Логирование ошибки
  @override
  void handle(Object error, [StackTrace? stackTrace, String? msg]) =>
      _talker.handle(error, stackTrace, msg);

  /// Логирование пользовательского лога
  @override
  void customLog(TalkerLog log) => _talker.logCustom(log);
}

/// Миксин для быстрого доступа к логгеру приложения
mixin Logger {
  IAppLogger get logger => getIt<IAppLogger>();
}
