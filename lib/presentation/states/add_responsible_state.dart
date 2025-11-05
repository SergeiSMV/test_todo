import 'package:equatable/equatable.dart';

/// Состояние при добавлении нового ответственного
abstract class AddResponsibleState extends Equatable {
  const AddResponsibleState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние (ещё не добавлен ответственный)
class AddResponsibleInitial extends AddResponsibleState {
  const AddResponsibleInitial();
}

/// Состояние загрузки
class AddResponsibleLoading extends AddResponsibleState {
  const AddResponsibleLoading();
}

/// Состояние успеха (данные получены)
class AddResponsibleSuccess extends AddResponsibleState {
  const AddResponsibleSuccess();
}

/// Состояние ошибки
class AddResponsibleError extends AddResponsibleState {
  const AddResponsibleError();
}
