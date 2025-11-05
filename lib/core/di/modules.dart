import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../data/local/database.dart';

/// Этот модуль используется библиотекой `injectable`
/// для регистрации зависимостей, у которых нет аннотаций внутри классов.
/// Все зависимости из этого модуля попадают в get_it при генерации кода.
@module
abstract class RegisterModule {
  /// Локальная база данных (Drift)
  @lazySingleton
  AppDatabase get database => AppDatabase();

  /// Talker — логгер для всего приложения
  @singleton
  Talker get talker => TalkerFlutter.init();
}
