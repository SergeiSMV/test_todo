import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/responsible_model.dart';

final responsibleFormProvider =
    StateNotifierProvider<ResponsibleFormNotifier, ResponsibleModel>(
      (ref) => ResponsibleFormNotifier(),
    );

class ResponsibleFormNotifier extends StateNotifier<ResponsibleModel> {
  ResponsibleFormNotifier() : super(ResponsibleModel.empty);

  /// Обновляет имя ответственного
  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  /// Обновляет телефон ответственного
  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  /// Очищает форму добавления ответственного
  void clear() {
    state = ResponsibleModel.empty;
  }
}
