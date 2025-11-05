import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/new_task_state/new_task_state.dart';
import 'add_task_provider.dart';
import 'task_form_provider.dart';
import 'task_validation_provider.dart';

/// Провайдер, объединяющий состояние формы и валидации
final newTaskProvider = Provider<NewTaskState>((ref) {
  final form = ref.watch(taskFormProvider);
  final validation = ref.watch(taskValidationProvider);
  final addTaskState = ref.watch(addTaskProvider);

  return NewTaskState(
    form: form,
    validation: validation,
    addTaskState: addTaskState,
  );
});
