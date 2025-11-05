import 'package:drift/drift.dart';

import '../../domain/models/responsible_model.dart';
import '../local/database.dart';

/// Mapper: ResponsibleTableData ↔ ResponsibleModel
extension ResponsibleTableMapper on ResponsibleTableData {
  /// Преобразует строку из таблицы в доменную модель
  ResponsibleModel toResponsibleModel() =>
      ResponsibleModel(id: id, name: name, phone: phone);
}

/// Mapper: ResponsibleModel ↔ ResponsibleTableCompanion
extension ResponsibleModelToCompanion on ResponsibleModel {
  /// Преобразует доменную модель в Companion для вставки/обновления в БД
  ResponsibleTableCompanion toResponsibleTableCompanion() =>
      ResponsibleTableCompanion(
        id: id == null ? const Value.absent() : Value(id!),
        name: Value(name),
        phone: Value(phone),
      );
}
