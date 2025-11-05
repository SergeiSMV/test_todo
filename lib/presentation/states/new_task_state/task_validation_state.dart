import 'package:equatable/equatable.dart';

/// Класс, описывающий состояние валидации формы задачи
class TaskValidationState extends Equatable {
  const TaskValidationState({this.descriptionError, this.dueDateError});

  /// Ошибка валидации описания задачи
  final String? descriptionError;

  /// Ошибка валидации даты выполнения задачи
  final String? dueDateError;

  /// Флаг, указывающий, является ли форма задачи валидной
  bool get isValid => descriptionError == null && dueDateError == null;

  TaskValidationState copyWith({
    /// Ошибка валидации названия задачи
    String? Function()? titleError,

    /// Ошибка валидации описания задачи
    String? Function()? descriptionError,

    /// Ошибка валидации даты выполнения задачи
    String? Function()? dueDateError,
  }) => TaskValidationState(
    descriptionError: descriptionError != null
        ? descriptionError()
        : this.descriptionError,
    dueDateError: dueDateError != null ? dueDateError() : this.dueDateError,
  );

  static const empty = TaskValidationState();

  @override
  List<Object?> get props => [descriptionError, dueDateError];
}
