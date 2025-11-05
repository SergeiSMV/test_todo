import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../core/utils/extensions/build_context_ext.dart';

/// Кастомный виджет для чекбокса
class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// Значение чекбокса
  final bool value;

  /// Обработчик изменения состояния чекбокса
  final ValueChanged<bool> onChanged;

  /// Цвет границы чекбокса
  Color _borderColor(BuildContext context) => value
      ? context.colors.mainColors.primary
      : context.colors.mainColors.secondary;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(4),
    onTap: () => onChanged(!value),
    child: Container(
      width: AppSizes.kIcon20,
      height: AppSizes.kIcon20,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor(context), width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: value
          ? Center(
              child: Icon(
                Icons.check,
                size: AppSizes.kIcon14,
                color: context.colors.mainColors.primary,
              ),
            )
          : null,
    ),
  );
}
