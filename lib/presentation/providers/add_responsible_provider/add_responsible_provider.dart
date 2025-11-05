import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/di.dart';
import '../../../domain/models/responsible_model.dart';
import '../../../domain/repositories/i_responsible_repository.dart';
import '../../states/add_responsible_state.dart';

final addResponsibleProvider =
    StateNotifierProvider<AddResponsibleNotifier, AddResponsibleState>(
      (ref) => AddResponsibleNotifier(getIt<IResponsibleRepository>()),
    );

class AddResponsibleNotifier extends StateNotifier<AddResponsibleState> {
  AddResponsibleNotifier(this._responsibleRepository)
    : super(const AddResponsibleInitial());

  /// Репозиторий для работы с ответственными
  final IResponsibleRepository _responsibleRepository;

  /// Добавляем ответственного
  Future<void> addResponsible(ResponsibleModel responsible) async {
    state = const AddResponsibleLoading();

    final result = await _responsibleRepository.addResponsible(responsible);

    result.fold(
      (failure) => state = AddResponsibleError(),
      (_) => state = AddResponsibleSuccess(),
    );
  }
}
