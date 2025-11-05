import 'package:flutter/material.dart';

import '../../presentation/widgets/default_states_widgets/empty_list_widget.dart';
import '../../presentation/widgets/default_states_widgets/error_loading_widget.dart';
import '../../presentation/widgets/default_states_widgets/loading_widget.dart';

/// Enum для отображения состояний
enum StatesEnums {
  /// Загрузка
  loading,

  /// Ошибка
  error,

  /// Пустой список
  empty;

  /// Виджет для отображения состояния
  Widget get widget {
    switch (this) {
      /// Загрузка
      case StatesEnums.loading:
        return const LoadingWidget();

      /// Ошибка
      case StatesEnums.error:
        return const ErrorLoadingWidget();

      /// Пустой список
      case StatesEnums.empty:
        return const EmptyListWidget();
    }
  }
}
