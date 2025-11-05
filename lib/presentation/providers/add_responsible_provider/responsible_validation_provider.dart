import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/gen/strings.g.dart';
import '../../states/responsible_validation_state.dart';

final responsibleValidationProvider =
    StateNotifierProvider<
      ResponsibleValidationNotifier,
      ResponsibleValidationState
    >((ref) => ResponsibleValidationNotifier());

class ResponsibleValidationNotifier
    extends StateNotifier<ResponsibleValidationState> {
  ResponsibleValidationNotifier() : super(ResponsibleValidationState.empty);

  /// Проверяет корректность имени ответственного
  void validateName(String name) {
    if (name.trim().isNotEmpty && name.trim().length < 2) {
      state = state.copyWith(nameError: () => t.validation_errors.name_error);
    } else {
      state = state.copyWith(nameError: () => null);
    }
  }

  /// Проверяет корректность телефона ответственного
  void validatePhone(String phone) {
    final trimmedPhone = phone.trim();
    final phoneRegex = RegExp(r'^\+7\d{10}$');

    if (trimmedPhone.isNotEmpty && !phoneRegex.hasMatch(trimmedPhone)) {
      state = state.copyWith(phoneError: () => t.validation_errors.phone_error);
    } else {
      state = state.copyWith(phoneError: () => null);
    }
  }
}
