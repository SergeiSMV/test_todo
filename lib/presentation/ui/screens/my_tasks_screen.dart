import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/presentation/widgets/app_bottom_sheet.dart';
import '../../../core/presentation/widgets/app_top_bar_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/empty_list_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/error_loading_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/loading_widget.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../providers/my_tasks_provider.dart';
import '../../states/my_tasks_state.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/task_filter_widget.dart';

/// Экран "Мои задачи"
@RoutePage()
class MyTasksScreen extends ConsumerStatefulWidget {
  const MyTasksScreen({super.key});

  @override
  ConsumerState<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends ConsumerState<MyTasksScreen> {
  @override
  void initState() {
    super.initState();
    // Загружаем задачи после первого построения виджета
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myTasksProvider.notifier).fetchMyTasks();
    });
  }

  /// Показывает bottom sheet для фильтрации задач
  Future<void> _showFilterBottomSheet(BuildContext context) async {
    await AppBottomSheet.show(
      context,
      child: TaskFilterWidget(
        filterProvider: taskFilterProvider,
        filterNotifier: (ref) => ref.read(taskFilterProvider.notifier),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Используем отфильтрованные задачи вместо исходных
    final myTasksState = ref.watch(filteredMyTasksProvider);

    return Scaffold(
      appBar: AppTopBarWidget(
        showBackButton: false,
        description: t.screen_titles.my_tasks.description,
        rightButton: IconButton(
          onPressed: () => _showFilterBottomSheet(context),
          icon: Icon(
            Icons.filter_list,
            size: AppSizes.kIcon24,
            color: context.colors.mainColors.primary,
          ),
        ),
      ),
      body: _buildMyTasksBody(myTasksState),
    );
  }

  Widget _buildMyTasksBody(MyTasksState state) {
    if (state is MyTasksLoading) {
      return LoadingWidget();
    }

    if (state is MyTasksSuccess) {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: state.tasks.length,
        itemBuilder: (context, i) {
          final task = state.tasks[i];
          return TaskItemWidget(key: ValueKey(task.id), task: task);
        },
      );
    }

    if (state is MyTasksEmpty) {
      return EmptyListWidget();
    }

    if (state is MyTasksError) {
      return ErrorLoadingWidget();
    }

    return const SizedBox.shrink();
  }
}
