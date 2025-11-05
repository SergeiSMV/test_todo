import 'package:equatable/equatable.dart';
import '../../../domain/models/responsible_model.dart';

/// cостояния экрана/виджета, отображающего ответственных
abstract class GetResponsibleState extends Equatable {
  const GetResponsibleState();

  @override
  List<Object?> get props => [];
}

/// Состояние загрузки
class GetResponsibleLoading extends GetResponsibleState {
  const GetResponsibleLoading();
}

/// Состояние успеха (данные получены)
class GetResponsibleSuccess extends GetResponsibleState {
  final List<ResponsibleModel> responsibles;

  const GetResponsibleSuccess(this.responsibles);

  @override
  List<Object?> get props => [responsibles];
}

/// Состояние ошибки
class GetResponsibleError extends GetResponsibleState {
  const GetResponsibleError();
}

/// Состояние пустых данных
class GetResponsibleEmpty extends GetResponsibleState {
  const GetResponsibleEmpty();
}
