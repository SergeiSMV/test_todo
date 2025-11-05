import 'dart:convert';

/// Расширение для объектов, которые можно преобразовать в строку.
extension ModelLoggerExtension on Object {
  /// Преобразует объект в строку для логирования.
  ///
  /// - [message] - сообщение для логирования.
  ///
  /// Возвращает строку с информацией о количестве элементов в списке и
  /// значениями элементов.
  String toJsonLog(String message) {
    try {
      if (this is List) {
        final list = this as List;
        final jsonData = list.map(_convertToJson).toList();
        return '''
From local DB ::: $message |
  "total": ${list.length},
  "data": ${const JsonEncoder.withIndent('  ').convert(jsonData)}
''';
      }

      final jsonData = _convertToJson(this);
      return '''
From local DB ::: $message |
${const JsonEncoder.withIndent('  ').convert(jsonData)}
''';
    } on Exception catch (_) {
      return toString();
    }
  }

  /// Преобразует объект в JSON-совместимый формат.
  dynamic _convertToJson(dynamic obj) {
    if (obj == null) return null;

    // Если у объекта есть метод toJson, используем его
    if (obj is Map<String, dynamic>) return obj;
    if (obj is List) return obj.map(_convertToJson).toList();
    if (obj is String || obj is num || obj is bool) return obj;

    // Пытаемся вызвать toJson метод через reflection
    try {
      final toJsonMethod = (obj as dynamic).toJson;
      if (toJsonMethod != null && toJsonMethod is Function) {
        return toJsonMethod();
      }
    } on Exception catch (_) {
      // Игнорируем ошибки reflection
    }

    // Если ничего не подошло, возвращаем строковое представление
    return obj.toString();
  }
}
