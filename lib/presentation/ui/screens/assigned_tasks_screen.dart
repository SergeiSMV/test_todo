import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/navigation/app_router.dart';
import '../../../core/presentation/widgets/app_bottom_sheet.dart';
import '../../../core/presentation/widgets/app_top_bar_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/empty_list_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/error_loading_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/loading_widget.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../providers/assigned_tasks_provider.dart';
import '../../states/assigned_tasks_state.dart';
import '../widgets/task_filter_widget.dart';
import '../widgets/task_item_widget.dart';

/// Экран "Мои задачи"
@RoutePage()
class AssignedTasksScreen extends ConsumerStatefulWidget {
  const AssignedTasksScreen({super.key});

  @override
  ConsumerState<AssignedTasksScreen> createState() =>
      _AssignedTasksScreenState();
}

class _AssignedTasksScreenState extends ConsumerState<AssignedTasksScreen> {
  @override
  void initState() {
    super.initState();
    // Загружаем задачи после первого построения виджета
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(assignedTasksProvider.notifier).fetchAssignedTasks();
    });
  }

  /// Показывает bottom sheet для фильтрации задач
  Future<void> _showFilterBottomSheet(BuildContext context) async {
    await AppBottomSheet.show(
      context,
      child: TaskFilterWidget(
        filterProvider: assignedTasksFilterProvider,
        filterNotifier: (ref) => ref.read(assignedTasksFilterProvider.notifier),
      ),
    );
  }

  /// Переходит на экран создания задачи
  Future<void> _goToTaskForm(BuildContext context) async =>
      context.router.push(AddTaskRoute());

  @override
  Widget build(BuildContext context) {
    // Используем отфильтрованные задачи вместо исходных
    final assignedTasksState = ref.watch(filteredAssignedTasksProvider);

    return Scaffold(
      appBar: AppTopBarWidget(
        showBackButton: false,
        description: t.screen_titles.assigned_tasks.description,
        rightButton: IconButton(
          onPressed: () => _showFilterBottomSheet(context),
          icon: Icon(
            Icons.filter_list,
            size: AppSizes.kIcon24,
            color: context.colors.mainColors.primary,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildAssignedTasksBody(assignedTasksState),
          Spacer(),
          TextButton(
            onPressed: () => _goToTaskForm(context),
            child: Text(t.task_form.add_task.title),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignedTasksBody(AssignedTasksState state) {
    if (state is AssignedTasksLoading) {
      return LoadingWidget();
    }

    if (state is AssignedTasksSuccess) {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: state.tasks.length,
        itemBuilder: (context, i) {
          final task = state.tasks[i];
          return TaskItemWidget(
            key: ValueKey(task.id),
            task: task,
            isAssigned: true,
          );
        },
      );
    }

    if (state is AssignedTasksEmpty) {
      return EmptyListWidget();
    }

    if (state is AssignedTasksError) {
      return ErrorLoadingWidget();
    }

    return const SizedBox.shrink();
  }
}
