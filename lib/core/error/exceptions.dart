/// Исключения на уровне data-слоя
/// Используются для проброса ошибок из БД
/// Обрабатываются в репозиториях и маппятся в Failure
library;

/// Исключение базы данных
class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException: $message';
}

/// Исключение валидации данных
class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);

  @override
  String toString() => 'ValidationException: $message';
}

/// Исключение преобразования/парсинга данных
class DataParsingException implements Exception {
  final String message;
  DataParsingException(this.message);

  @override
  String toString() => 'DataParsingException: $message';
}
