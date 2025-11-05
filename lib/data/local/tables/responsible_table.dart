import 'package:drift/drift.dart';

/// Таблица ответственных за задачи
class ResponsibleTable extends Table {
  /// Идентификатор ответственного (автоинкремент)
  IntColumn get id => integer().autoIncrement()();

  /// Имя ответственного
  TextColumn get name => text()();

  /// Телефон ответственного
  TextColumn get phone => text()();

  /// Статус записи (active / inactive)
  TextColumn get status => text().withDefault(const Constant('active'))();
}
