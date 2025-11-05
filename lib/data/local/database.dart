import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'dao/responsible_dao.dart';
import 'dao/task_dao.dart';
import 'tables/responsible_table.dart';
import 'tables/task_table.dart';

part 'database.g.dart';

/// DriftDatabase — основной класс локальной БД
@DriftDatabase(
  tables: [ResponsibleTable, TaskTable],
  daos: [ResponsibleDao, TaskDao],
)
/// База данных приложения (Drift)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Версия схемы базы данных
  @override
  int get schemaVersion => 1;

  /// Стратегия миграции базы данных
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();

      // После создания базы — добавляем дефолтного пользователя
      await responsibleDao.initDefaultUser();
    },
  );
}

/// Открываем соединение с SQLite (файл создается в папке приложения)
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todo_list.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
