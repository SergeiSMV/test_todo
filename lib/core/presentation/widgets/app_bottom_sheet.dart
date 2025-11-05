import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../utils/constants/app_borders.dart';

/// Класс, содержащий методы для вызова модальных окон.
abstract class AppBottomSheet {
  /// Показывает модальное окно
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool fullHeight = false,
    Color? backgroundColor,
  }) async => showModalBottomSheet<T>(
    isScrollControlled: true,
    context: context,
    backgroundColor: backgroundColor ?? context.colors.mainColors.white,
    barrierColor: context.colors.mainColors.bottomSheetBlackout,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorders.kTopLeft20 + AppBorders.kTopRight20,
    ),
    routeSettings: RouteSettings(
      name: '${_getCallerName(context)} → bottom_sheet',
    ),
    constraints: BoxConstraints(
      minWidth: context.screenSize.width,
      maxHeight: context.screenSize.height * 0.9,
    ),
    builder: (context) => SizedBox(
      height: fullHeight ? context.screenSize.height * 0.9 : null,
      child: SingleChildScrollView(child: child),
    ),
  );

  /// Получает имя вызывающего экрана из контекста
  ///
  /// Нужен для отслеживания вызывающего экрана при открытии модального окна.
  /// Пример:
  /// *Open route named MediaRoute → bottom_sheet*
  static String _getCallerName(BuildContext context) {
    final route = ModalRoute.of(context);
    return route?.settings.name ?? 'unknown_screen';
  }
}
