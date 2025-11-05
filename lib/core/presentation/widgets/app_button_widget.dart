import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../utils/constants/app_borders.dart';
import '../../utils/constants/app_sizes.dart';

/// Виджет основной кнопки приложения.
class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    required this.text,
    required this.onTap,
    super.key,
    this.isActive = true,
  });

  /// Текст кнопки.
  final String text;

  /// Нажатая кнопка.
  final VoidCallback? onTap;

  /// Активная ли кнопка
  final bool isActive;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: AppSizes.kButtonHeight46,
    decoration: BoxDecoration(
      color: isActive
          ? context.colors.mainColors.primary
          : context.colors.mainColors.primaryLight,
      borderRadius: AppBorders.kAll8,
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: context.textStyles.regularTextStyles.montserrat14.copyWith(
              color: isActive
                  ? context.colors.mainColors.white
                  : context.colors.mainColors.primary,
            ),
          ),
        ),
      ),
    ),
  );
}
