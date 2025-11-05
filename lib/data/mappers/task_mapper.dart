import 'package:drift/drift.dart';

import '../../core/utils/enums/priority_enums.dart';
import '../local/database.dart';
import '../../domain/models/responsible_model.dart';
import '../../domain/models/task_model.dart';

/// Mapper: TaskTableData ↔ TaskModel
extension TaskTableMapper on TaskTableData {
  TaskModel toTaskModel(ResponsibleModel responsible) => TaskModel(
    id: id,
    description: description,
    responsible: responsible,
    priority: PriorityEnum.getPriorityByName(priority),
    dueDate: dueDate,
    status: status,
  );
}

/// Маппер для конвертации между TaskModel и TaskTableData / Companion
extension TaskMapper on TaskModel {
  /// Преобразует доменную модель в Drift companion
  TaskTableCompanion toTaskTableCompanion() {
    return TaskTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      description: Value(description),
      responsibleId: Value(responsible.id ?? 0),
      priority: Value(priority?.apiName ?? ''),
      status: Value(status),
      dueDate: Value(dueDate!),
    );
  }
}
