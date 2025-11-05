import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';
import 'package:todo_list/core/utils/helpers/date_format_helper.dart';
import 'package:todo_list/presentation/providers/my_tasks_provider.dart';

import '../../../core/utils/constants/app_borders.dart';
import '../../../core/utils/constants/app_boxes.dart';
import '../../../core/utils/constants/app_insets.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../domain/models/task_model.dart';
import '../../providers/assigned_tasks_provider.dart';
import 'checkbox_widget.dart';

/// Виджет для отображения задачи
class TaskItemWidget extends ConsumerWidget {
  const TaskItemWidget({
    super.key,
    required this.task,
    this.isAssigned = false,
  });

  /// Модель задачи
  final TaskModel task;

  /// Флаг, является ли задача ответственным
  final bool isAssigned;

  /// Обработчик изменения статуса задачи
  void _changeStatus(WidgetRef ref, bool value) => isAssigned
      ? ref.read(assignedTasksProvider.notifier).updateTask(task.id!, value)
      : ref.read(myTasksProvider.notifier).updateTask(task.id!, value);

  /// Получение цвета текста
  Color _getColor(BuildContext context) {
    return task.status
        ? context.colors.mainColors.secondary
        : context.colors.mainColors.primary;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: AppInsets.bottom8,
      child: Container(
        padding: AppInsets.h12 + AppInsets.v5,
        decoration: BoxDecoration(
          color: context.colors.mainColors.white,
          borderRadius: AppBorders.kAll8,
          boxShadow: [
            BoxShadow(
              color: context.colors.mainColors.shadow
                  .withValues(alpha: 0.4)
                  .withAlpha(40),
              blurRadius: 3,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: task.status
                    ? context.colors.mainColors.secondary
                    : task.priority!.getColor(context),
                shape: BoxShape.circle,
              ),
              width: AppSizes.kIcon14,
              height: AppSizes.kIcon14,
            ),
            AppBoxes.kWidth10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.responsible.name,
                    style: context.textStyles.regularTextStyles.montserrat14
                        .copyWith(color: _getColor(context)),
                  ),
                  if (task.responsible.phone.isNotEmpty) ...[
                    Text(
                      "телефон: ${task.responsible.phone}",
                      style: context.textStyles.regularTextStyles.montserrat14
                          .copyWith(color: _getColor(context)),
                    ),
                    AppBoxes.kHeight5,
                  ],

                  Text(
                    task.description,
                    style: context.textStyles.regularTextStyles.montserrat12
                        .copyWith(color: _getColor(context)),
                  ),
                  Text(
                    task.dueDate?.toString().toDDMMYYYY ?? '',
                    style: context.textStyles.regularTextStyles.montserrat10
                        .copyWith(color: context.colors.mainColors.secondary),
                  ),
                ],
              ),
            ),

            CheckboxWidget(
              value: task.status,
              onChanged: (value) => _changeStatus(ref, value),
            ),
            AppBoxes.kWidth10,
          ],
        ),
      ),
    );
  }
}
