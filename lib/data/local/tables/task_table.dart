import 'package:drift/drift.dart';

/// Таблица задач
class TaskTable extends Table {
  /// Идентификатор задачи (автоинкремент)
  IntColumn get id => integer().autoIncrement()();

  /// Описание задачи
  TextColumn get description => text()();

  /// Ответственный за задачу
  IntColumn get responsibleId => integer()();

  /// Приоритет задачи
  TextColumn get priority => text()();

  /// Дата исполнения задачи
  DateTimeColumn get dueDate => dateTime()();

  /// Статус задачи (true - активна, false - неактивна)
  BoolColumn get status => boolean().withDefault(const Constant(true))();
}
