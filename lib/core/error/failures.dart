import 'package:equatable/equatable.dart';

/// Класс [Failure] является базовым классом для всех ошибок, которые могут
/// возникнуть в приложении. Содержит описание ошибки (при наличии)
sealed class Failure with EquatableMixin implements Exception {
  /// Создает экземпляр [Failure]
  /// - [error] - описание ошибки
  const Failure(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

//--- Database ----------------------------------------------------------------

/// Ошибка базы данных (например, при работе с Drift)
class DatabaseFailure extends Failure {
  /// Создает экземпляр [DatabaseFailure]
  /// - [error] - описание ошибки
  const DatabaseFailure([super.error = 'Database failure']);
}

//--- Data ---------------------------------------------------------------------

/// Ошибка при работе с данными (например, DAO вернул null)
class DataFailure extends Failure {
  /// Создает экземпляр [DataFailure]
  /// - [error] - описание ошибки
  const DataFailure([super.error = 'Data failure']);
}

//--- Validation ---------------------------------------------------------------

/// Ошибка валидации пользовательского ввода
class ValidationFailure extends Failure {
  /// Создает экземпляр [ValidationFailure]
  /// - [error] - описание ошибки
  const ValidationFailure([super.error = 'Validation failure']);
}

//--- Unknown ------------------------------------------------------------------

/// Общая (непредвиденная) ошибка
class UnknownFailure extends Failure {
  /// Создает экземпляр [UnknownFailure]
  /// - [error] - описание ошибки
  const UnknownFailure([super.error = 'Unknown failure']);
}

//--- Responsible --------------------------------------------------------------

/// Ошибка при работе с ответственными за задачи
class ResponsibleRepositoryFailure extends Failure {
  /// Создает экземпляр [ResponsibleRepositoryFailure]
  /// - [error] - описание ошибки
  const ResponsibleRepositoryFailure([
    super.error = 'Responsible repository failure',
  ]);
}

//--- Tasks --------------------------------------------------------------------

/// Ошибка при работе с задачами
class TasksRepositoryFailure extends Failure {
  /// Создает экземпляр [TasksRepositoryFailure]
  /// - [error] - описание ошибки
  const TasksRepositoryFailure([super.error = 'Tasks repository failure']);
}
