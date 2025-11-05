import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/presentation/widgets/app_button_widget.dart';
import '../../../core/utils/constants/app_boxes.dart';
import '../../../core/utils/constants/app_insets.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/enums/priority_enums.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../../domain/models/task_filter.dart';
import 'checkbox_widget.dart';

/// Виджет для фильтрации задач
class TaskFilterWidget extends ConsumerStatefulWidget {
  const TaskFilterWidget({
    super.key,
    required this.filterProvider,
    required this.filterNotifier,
  });

  /// Провайдер фильтра для конкретного списка задач
  final ProviderListenable<TaskFilter> filterProvider;

  /// Notifier для управления фильтром (возвращает объект с методами setPriority, setStatus, clearFilters)
  final dynamic Function(WidgetRef ref) filterNotifier;

  @override
  ConsumerState<TaskFilterWidget> createState() => _TaskFilterWidgetState();
}

class _TaskFilterWidgetState extends ConsumerState<TaskFilterWidget> {
  PriorityEnum? _selectedPriority;
  bool? _selectedStatus;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Инициализируем значения из текущего фильтра при первом построении
    if (_selectedPriority == null && _selectedStatus == null) {
      final currentFilter = ref.read(widget.filterProvider);
      _selectedPriority = currentFilter.priority;
      _selectedStatus = currentFilter.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.h20 + AppInsets.top20 + AppInsets.bottom20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            t.task_filter.title,
            style: context.textStyles.regularTextStyles.montserrat20.copyWith(
              color: context.colors.mainColors.primary,
            ),
          ),
          AppBoxes.kHeight5,
          Text(
            t.task_filter.description,
            style: context.textStyles.regularTextStyles.montserrat12.copyWith(
              color: context.colors.mainColors.secondary,
            ),
          ),
          Divider(color: context.colors.mainColors.secondary, thickness: 0.5),
          AppBoxes.kHeight20,

          // Фильтр по приоритету
          _buildPrioritySection(context),
          AppBoxes.kHeight20,

          // Фильтр по статусу
          _buildStatusSection(context),
          AppBoxes.kHeight30,

          // Кнопки действий
          Row(
            children: [
              Expanded(
                child: AppButtonWidget(
                  text: t.task_filter.clear,
                  onTap: _clearFilters,
                  isActive: true,
                ),
              ),
              AppBoxes.kWidth10,
              Expanded(
                child: AppButtonWidget(
                  text: t.task_filter.apply,
                  onTap: _applyFilters,
                  isActive: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Секция выбора приоритета
  Widget _buildPrioritySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.task_filter.priority,
          style: context.textStyles.regularTextStyles.montserrat14.copyWith(
            color: context.colors.mainColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppBoxes.kHeight10,
        _buildPriorityOption(context, null, t.task_filter.all_priorities),
        ...PriorityEnum.values.map(
          (priority) => _buildPriorityOption(
            context,
            priority,
            priority.name,
            priorityColor: priority,
          ),
        ),
      ],
    );
  }

  /// Опция выбора приоритета
  Widget _buildPriorityOption(
    BuildContext context,
    PriorityEnum? priority,
    String label, {
    PriorityEnum? priorityColor,
  }) {
    final isSelected = _selectedPriority == priority;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedPriority = priority;
        });
      },
      child: Padding(
        padding: AppInsets.v8,
        child: Row(
          children: [
            CheckboxWidget(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  _selectedPriority = value ? priority : null;
                });
              },
            ),
            AppBoxes.kWidth10,
            if (priorityColor != null) ...[
              Container(
                decoration: BoxDecoration(
                  color: priorityColor.getColor(context),
                  shape: BoxShape.circle,
                ),
                width: AppSizes.kIcon10,
                height: AppSizes.kIcon10,
              ),
              AppBoxes.kWidth10,
            ],
            Text(
              label,
              style: context.textStyles.regularTextStyles.montserrat14.copyWith(
                color: context.colors.mainColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Секция выбора статуса
  Widget _buildStatusSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.task_filter.status,
          style: context.textStyles.regularTextStyles.montserrat14.copyWith(
            color: context.colors.mainColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppBoxes.kHeight10,
        _buildStatusOption(context, null, t.task_filter.all_statuses),
        _buildStatusOption(context, false, t.task_filter.active),
        _buildStatusOption(context, true, t.task_filter.inactive),
      ],
    );
  }

  /// Опция выбора статуса
  Widget _buildStatusOption(BuildContext context, bool? status, String label) {
    final isSelected = _selectedStatus == status;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedStatus = status;
        });
      },
      child: Padding(
        padding: AppInsets.v8,
        child: Row(
          children: [
            CheckboxWidget(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value ? status : null;
                });
              },
            ),
            AppBoxes.kWidth10,
            Text(
              label,
              style: context.textStyles.regularTextStyles.montserrat14.copyWith(
                color: context.colors.mainColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Сбрасывает фильтры
  void _clearFilters() {
    setState(() {
      _selectedPriority = null;
      _selectedStatus = null;
    });
    widget.filterNotifier(ref).clearFilters();
    Navigator.of(context).pop();
  }

  /// Применяет фильтры
  void _applyFilters() {
    final filterNotifier = widget.filterNotifier(ref);
    filterNotifier.setPriority(_selectedPriority);
    filterNotifier.setStatus(_selectedStatus);
    Navigator.of(context).pop();
  }
}
