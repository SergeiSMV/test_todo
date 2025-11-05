import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/di/di.dart';
import '../../domain/repositories/i_responsible_repository.dart';
import '../states/get_responsible_state.dart';

/// Провайдер состояния для списка ответственных
final getResponsibleProvider =
    StateNotifierProvider<GetResponsibleNotifier, GetResponsibleState>(
      (ref) => GetResponsibleNotifier(getIt<IResponsibleRepository>()),
    );

/// Notifier для управления состоянием списка ответственных
class GetResponsibleNotifier extends StateNotifier<GetResponsibleState> {
  GetResponsibleNotifier(this._responsibleRepository)
    : super(const GetResponsibleLoading());

  /// Репозиторий для работы с ответственными
  final IResponsibleRepository _responsibleRepository;

  /// Получает список ответственных
  Future<void> fetchResponsibles() async {
    /// Задержка для имитации загрузки
    await Future.delayed(const Duration(seconds: 1));

    final result = await _responsibleRepository.getResponsibles();

    /// Обрабатываем результат
    result.fold(
      (failure) => state = GetResponsibleError(),
      (responsibles) => state = responsibles.isEmpty
          ? const GetResponsibleEmpty()
          : GetResponsibleSuccess(responsibles),
    );
  }
}
