import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

/// Класс для определения стилей текстового поля
abstract final class TextFieldTheme {
  /// Цвет границы выбранного поля ввода
  /// [validationError] - ошибка валидации
  static Color focusedBorderColor(
    BuildContext context,
    String? validationError,
  ) => validationError != null
      ? context.colors.mainColors.error
      : context.colors.mainColors.primary;

  /// Цвет основной границы поля ввода
  /// [validationError] - ошибка валидации
  static Color borderColor(BuildContext context, String? validationError) =>
      validationError != null
      ? context.colors.mainColors.error
      : context.colors.mainColors.primary;

  /// Ширина основной границы поля ввода
  /// [validationError] - ошибка валидации
  static double borderWidth(BuildContext context, String? validationError) =>
      validationError != null ? 1.5 : 0.5;

  /// Ширина границы заполненного поля ввода
  /// [validationError] - ошибка валидации
  /// [controllerText] - текст в поле ввода
  static double enabledBorderWidth(
    BuildContext context,
    String? validationError,
    String controllerText,
  ) => validationError != null || controllerText.isNotEmpty ? 1 : 0.5;

  /// Цвет границы заполненного поля ввода
  /// [validationError] - ошибка валидации
  /// [controllerText] - текст в поле ввода
  static Color enabledBorderColor(
    BuildContext context,
    String? validationError,
    String controllerText,
  ) {
    if (validationError != null) {
      return context.colors.mainColors.error;
    }
    if (controllerText.isNotEmpty) {
      return context.colors.mainColors.primary;
    }
    return context.colors.mainColors.secondary;
  }
}
