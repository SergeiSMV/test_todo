import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/constants/app_boxes.dart';
import 'package:todo_list/core/utils/constants/app_sizes.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/utils/constants/app_insets.dart';
import '../../../core/utils/enums/priority_enums.dart';
import '../../../core/utils/gen/strings.g.dart';

/// Виджет для выбора приоритета задачи
class TaskPriorityWidget extends StatelessWidget {
  const TaskPriorityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.h20 + AppInsets.top20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.task_priority.title,
            style: context.textStyles.regularTextStyles.montserrat20.copyWith(
              color: context.colors.mainColors.primary,
            ),
          ),
          Text(
            t.task_priority.description,
            style: context.textStyles.regularTextStyles.montserrat12.copyWith(
              color: context.colors.mainColors.secondary,
            ),
          ),
          Divider(color: context.colors.mainColors.secondary, thickness: 0.5),
          AppBoxes.kHeight5,

          ...PriorityEnum.values.map(
            (priority) => _PriorityItem(priority: priority),
          ),
          AppBoxes.kHeight30,
        ],
      ),
    );
  }
}

/// Виджет для отображения приоритета задачи
class _PriorityItem extends StatelessWidget {
  const _PriorityItem({required this.priority});

  /// Приоритет задачи
  final PriorityEnum priority;

  /// Выбор приоритета задачи
  void _onPrioritySelected(BuildContext context) {
    context.router.pop(priority);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onPrioritySelected(context),
      child: Padding(
        padding: AppInsets.v5,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: priority.getColor(context),
                shape: BoxShape.circle,
              ),
              width: AppSizes.kIcon10,
              height: AppSizes.kIcon10,
            ),
            AppBoxes.kWidth10,
            Text(
              priority.name,
              style: context.textStyles.regularTextStyles.montserrat14.copyWith(
                color: context.colors.mainColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
