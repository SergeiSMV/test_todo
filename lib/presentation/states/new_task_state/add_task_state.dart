import 'package:equatable/equatable.dart';

/// cостояние при добавлении новой задачи
abstract class AddTaskState extends Equatable {
  const AddTaskState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние (ещё не добавлена задача)
class AddTaskInitial extends AddTaskState {
  const AddTaskInitial();
}

/// Состояние загрузки
class AddTaskLoading extends AddTaskState {
  const AddTaskLoading();
}

/// Состояние успеха (данные получены)
class AddTaskSuccess extends AddTaskState {
  const AddTaskSuccess();
}

/// Состояние ошибки
class AddTaskError extends AddTaskState {
  const AddTaskError();
}
