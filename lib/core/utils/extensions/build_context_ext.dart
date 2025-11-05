import 'package:flutter/material.dart';
import 'package:todo_list/core/theme/colors/base_colors.dart';

import '../../theme/text_styles/base_text_styles.dart';

/// Расширение для [BuildContext] для удобного доступа к вспомогательным методам
/// и свойствам. Все методы и свойства возвращаются через контекст для
/// использования в виджетах.
extension BuildContextExt on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);

  // Тема приложения
  ThemeData get theme => Theme.of(this);

  // Цвета приложения
  BaseColors get colors => theme.extension<BaseColors>()!;

  /// Высота статус бара
  double get statusBarHeight => _mediaQuery.padding.top;

  // Размер экрана
  Size get screenSize => _mediaQuery.size;

  // Типографика приложения
  BaseTextStyles get textStyles => theme.extension<BaseTextStyles>()!;

  /// Убирает фокус с текущего поля ввода
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
