import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/presentation/widgets/app_button_widget.dart';
import '../../../core/presentation/widgets/textfield_default_widget.dart';
import '../../../core/utils/constants/app_boxes.dart';
import '../../../core/utils/constants/app_insets.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../../domain/models/responsible_model.dart';
import '../../providers/add_responsible_provider/add_responsible_provider.dart';
import '../../providers/add_responsible_provider/responsible_form_provider.dart';
import '../../providers/add_responsible_provider/responsible_validation_provider.dart';
import '../../providers/get_responsible_provider.dart';
import '../../states/add_responsible_state.dart';

class AddResponsibleWidget extends ConsumerWidget {
  const AddResponsibleWidget({super.key});

  /// Сохраняем ответственного
  void _saveResponsible(
    BuildContext context,
    WidgetRef ref,
    ResponsibleModel responsible,
  ) {
    final addResponsibleNotifier = ref.read(addResponsibleProvider.notifier);
    addResponsibleNotifier.addResponsible(responsible);
  }

  /// Отслеживание результата добавления ответственного
  /// Отслеживание результата добавления задачи
  void _listenToAddTaskResult(
    BuildContext context,
    WidgetRef ref,
    ResponsibleFormNotifier responsibleFormNotifier,
  ) {
    ref.listen<AddResponsibleState>(addResponsibleProvider, (previous, next) {
      if (next is AddResponsibleSuccess) {
        // Действие при успешном добавлении задачи
        responsibleFormNotifier.clear();
        ref.read(getResponsibleProvider.notifier).fetchResponsibles();
        context.router.pop();
      } else if (next is AddResponsibleError) {
        // Действие при ошибке добавления задачи
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Ошибка при добавлении ответственного'),
            backgroundColor: context.colors.mainColors.error,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Notifier для управления состоянием добавления ответственного
    final responsibleFormNotifier = ref.read(responsibleFormProvider.notifier);

    /// Notifier для управления состоянием валидации ответственного
    final responsibleValidationNotifier = ref.read(
      responsibleValidationProvider.notifier,
    );

    /// Состояние валидации ответственного
    final responsibleValidationState = ref.watch(responsibleValidationProvider);

    /// Состояние формы ответственного
    final responsibleFormState = ref.watch(responsibleFormProvider);

    /// Отслеживание результата добавления ответственного
    _listenToAddTaskResult(context, ref, responsibleFormNotifier);

    return Padding(
      padding: AppInsets.h20 + AppInsets.top20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.add_responsible.title,
            style: context.textStyles.regularTextStyles.montserrat20.copyWith(
              color: context.colors.mainColors.primary,
            ),
          ),
          Text(
            t.add_responsible.description,
            style: context.textStyles.regularTextStyles.montserrat12.copyWith(
              color: context.colors.mainColors.secondary,
            ),
          ),
          Divider(color: context.colors.mainColors.secondary, thickness: 0.5),
          AppBoxes.kHeight5,

          TextFieldDefaultWidget(
            error: responsibleValidationState.nameError,
            title: t.add_responsible.name_title,
            hintText: t.add_responsible.name_hint,
            onValueChanged: (String name) {
              responsibleValidationNotifier.validateName(name);
              responsibleFormNotifier.updateName(name);
            },
          ),
          AppBoxes.kHeight20,
          TextFieldDefaultWidget(
            error: responsibleValidationState.phoneError,
            keyboardType: TextInputType.phone,
            title: t.add_responsible.phone_title,
            hintText: t.add_responsible.phone_hint,
            onValueChanged: (String phone) {
              responsibleValidationNotifier.validatePhone(phone);
              responsibleFormNotifier.updatePhone(phone);
            },
          ),

          AppBoxes.kHeight20,

          AppButtonWidget(
            isActive:
                responsibleValidationState.isValid &&
                responsibleFormState.isValid,
            text: t.add_responsible.save,
            onTap: () =>
                responsibleValidationState.isValid &&
                    responsibleFormState.isValid
                ? _saveResponsible(context, ref, responsibleFormState)
                : null,
          ),

          AppBoxes.kHeight30,
        ],
      ),
    );
  }
}
