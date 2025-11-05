import 'package:equatable/equatable.dart';

import '../../domain/models/task_model.dart';

abstract class AssignedTasksState extends Equatable {
  const AssignedTasksState();

  @override
  List<Object?> get props => [];
}

/// Состояние загрузки
class AssignedTasksLoading extends AssignedTasksState {
  const AssignedTasksLoading();
}

/// Состояние успеха
class AssignedTasksSuccess extends AssignedTasksState {
  final List<TaskModel> tasks;
  const AssignedTasksSuccess(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

/// Состояние ошибки
class AssignedTasksError extends AssignedTasksState {
  const AssignedTasksError();
}

/// Состояние пустых данных
class AssignedTasksEmpty extends AssignedTasksState {
  const AssignedTasksEmpty();
}
