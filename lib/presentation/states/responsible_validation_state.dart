import 'package:equatable/equatable.dart';

/// Состояние валидации формы ответственного
class ResponsibleValidationState extends Equatable {
  const ResponsibleValidationState({this.nameError, this.phoneError});

  final String? nameError;
  final String? phoneError;

  /// Флаг, указывающий, является ли форма ответственного валидной
  bool get isValid => nameError == null && phoneError == null;

  ResponsibleValidationState copyWith({
    String? Function()? nameError,
    String? Function()? phoneError,
  }) {
    return ResponsibleValidationState(
      nameError: nameError != null ? nameError() : this.nameError,
      phoneError: phoneError != null ? phoneError() : this.phoneError,
    );
  }

  static const empty = ResponsibleValidationState();

  @override
  List<Object?> get props => [nameError, phoneError];
}
