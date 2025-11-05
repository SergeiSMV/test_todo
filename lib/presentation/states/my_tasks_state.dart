import 'package:equatable/equatable.dart';

import '../../domain/models/task_model.dart';

abstract class MyTasksState extends Equatable {
  const MyTasksState();

  @override
  List<Object?> get props => [];
}

/// Состояние загрузки
class MyTasksLoading extends MyTasksState {
  const MyTasksLoading();
}

/// Состояние успеха
class MyTasksSuccess extends MyTasksState {
  final List<TaskModel> tasks;
  const MyTasksSuccess(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

/// Состояние ошибки
class MyTasksError extends MyTasksState {
  const MyTasksError();
}

/// Состояние пустых данных
class MyTasksEmpty extends MyTasksState {
  const MyTasksEmpty();
}
