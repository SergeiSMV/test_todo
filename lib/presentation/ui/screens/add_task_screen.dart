import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';
import 'package:todo_list/core/utils/helpers/date_format_helper.dart';

import '../../../core/navigation/app_router.dart';
import '../../../core/presentation/widgets/app_bottom_sheet.dart';
import '../../../core/presentation/widgets/app_button_widget.dart';
import '../../../core/presentation/widgets/app_top_bar_widget.dart';
import '../../../core/presentation/widgets/default_states_widgets/loading_widget.dart';
import '../../../core/presentation/widgets/textfield_default_widget.dart';
import '../../../core/utils/constants/app_boxes.dart';
import '../../../core/utils/constants/app_insets.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../../domain/models/responsible_model.dart';
import '../../../domain/models/task_model.dart';
import '../../providers/assigned_tasks_provider.dart';
import '../../providers/my_tasks_provider.dart';
import '../../providers/new_task_provider/add_task_provider.dart';
import '../../providers/new_task_provider/new_task_provider.dart';
import '../../providers/new_task_provider/task_form_provider.dart';
import '../../providers/new_task_provider/task_validation_provider.dart';
import '../../states/new_task_state/add_task_state.dart';
import '../widgets/task_prority_widget.dart';

/// Экран формы создания задачи
@RoutePage()
class AddTaskScreen extends ConsumerWidget {
  const AddTaskScreen({super.key});

  /// метод для выбора приоритета задачи
  Future<void> _showPriorityBottomSheet(
    BuildContext context,
    TaskFormNotifier taskNotifier,
  ) async {
    await AppBottomSheet.show(
      context,
      child: TaskPriorityWidget(),
    ).then((priority) => taskNotifier.updatePriority(priority));
  }

  /// метод для выбора даты выполнения задачи
  Future<void> _pickDate(
    BuildContext context,
    TaskFormNotifier taskNotifier,
    TaskValidationNotifier validationNotifier,
  ) async {
    await showDatePicker(
      context: context,
      locale: const Locale('ru', 'RU'),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: t.task_form.due_date.hint_text,
      cancelText: t.task_form.calendar.cancel,
      confirmText: t.task_form.calendar.confirm,
    ).then((date) {
      if (date != null) {
        taskNotifier.updateDueDate(date);
        validationNotifier.validateDueDate(date);
      }
    });
  }

  /// Переходит на экран выбора ответственногоs
  void _chooseInCharge(BuildContext context, TaskFormNotifier taskNotifier) {
    context.router.push(ResponsibleRoute()).then((responsible) {
      if (responsible is ResponsibleModel) {
        taskNotifier.updateResponsible(responsible);
      }
    });
  }

  /// Сохраняет задачу
  void _saveTask(
    BuildContext context,
    AddTaskNotifier addTaskNotifier,
    TaskModel task,
  ) {
    addTaskNotifier.addTask(task);
  }

  /// Отслеживание результата добавления задачи
  void _listenToAddTaskResult(
    BuildContext context,
    WidgetRef ref,
    TaskFormNotifier taskNotifier,
  ) {
    ref.listen<AddTaskState>(addTaskProvider, (previous, next) {
      if (next is AddTaskSuccess) {
        // Действие при успешном добавлении задачи
        taskNotifier.clearForm();
        ref.read(myTasksProvider.notifier).fetchMyTasks();
        ref.read(assignedTasksProvider.notifier).fetchAssignedTasks();
        context.router.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Задача успешно добавлена'),
            backgroundColor: Colors.green,
          ),
        );
      } else if (next is AddTaskError) {
        // Действие при ошибке добавления задачи
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Ошибка при добавлении задачи'),
            backgroundColor: context.colors.mainColors.error,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Notifier для управления состоянием валидации формы задачи
    final validationNotifier = ref.read(taskValidationProvider.notifier);

    /// Notifier для управления состоянием формы задачи
    final taskNotifier = ref.read(taskFormProvider.notifier);

    /// Notifier для управления состоянием добавления задачи
    final addTaskNotifier = ref.read(addTaskProvider.notifier);

    /// Состояние новой задачи
    final newTaskState = ref.watch(newTaskProvider);

    /// Отслеживание результата добавления задачи
    _listenToAddTaskResult(context, ref, taskNotifier);

    return Stack(
      children: [
        Scaffold(
          appBar: AppTopBarWidget(
            showBackButton: true,
            description: t.task_form.app_bar.description,
            rightButton: IconButton(
              onPressed: () => taskNotifier.clearForm(),
              icon: Icon(
                Icons.delete_sweep,
                size: AppSizes.kIcon24,
                color: context.colors.mainColors.primary,
              ),
            ),
          ),
          body: Padding(
            padding: AppInsets.h20 + AppInsets.top30,
            child: Column(
              children: [
                /// Описание задачи
                TextFieldDefaultWidget(
                  initialValue: newTaskState.form.description,
                  error: newTaskState.validation.descriptionError,
                  isMultiline: true,
                  keyboardType: TextInputType.multiline,
                  title: t.task_form.task_description.title,
                  hintText: t.task_form.task_description.hint_description,
                  onValueChanged: (String description) {
                    validationNotifier.validateDescription(description);
                    taskNotifier.updateDescription(description);
                  },
                ),

                AppBoxes.kHeight20,

                /// Приоритет задачи
                TextFieldDefaultWidget(
                  key: ValueKey(newTaskState.form.priority),
                  onTap: () => _showPriorityBottomSheet(context, taskNotifier),
                  readOnly: true,
                  initialValue: newTaskState.form.priority?.name,
                  keyboardType: TextInputType.multiline,
                  title: t.task_form.priority.title,
                  hintText: t.task_form.priority.hint_text,
                ),

                AppBoxes.kHeight20,

                /// Дата выполнения задачи
                TextFieldDefaultWidget(
                  key: ValueKey(newTaskState.form.dueDate),
                  initialValue: newTaskState.form.dueDate
                      ?.toString()
                      .toDDMMYYYY,
                  onTap: () =>
                      _pickDate(context, taskNotifier, validationNotifier),
                  readOnly: true,
                  keyboardType: TextInputType.multiline,
                  title: t.task_form.due_date.title,
                  hintText: t.task_form.due_date.hint_text,
                  error: newTaskState.validation.dueDateError,
                ),

                AppBoxes.kHeight20,

                /// Ответственный за выполнение задачи
                TextFieldDefaultWidget(
                  key: ValueKey(newTaskState.form.responsible.id),
                  initialValue: newTaskState.form.responsible.name,
                  onTap: () => _chooseInCharge(context, taskNotifier),
                  readOnly: true,
                  keyboardType: TextInputType.multiline,
                  title: t.task_form.responsible.title,
                  hintText: t.task_form.responsible.hint_responsible,
                ),

                Spacer(),

                AppButtonWidget(
                  isActive:
                      newTaskState.form.isValid &&
                      newTaskState.validation.isValid,
                  text: t.task_form.add_task.title,
                  onTap: () =>
                      newTaskState.form.isValid &&
                          newTaskState.validation.isValid
                      ? _saveTask(context, addTaskNotifier, newTaskState.form)
                      : null,
                ),

                AppBoxes.kHeight30,
              ],
            ),
          ),
        ),

        if (newTaskState.addTaskState is AddTaskLoading)
          /// Фон загрузки
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: context.colors.mainColors.white.withValues(alpha: 0.8),
              child: LoadingWidget(),
            ),
          ),
      ],
    );
  }
}
