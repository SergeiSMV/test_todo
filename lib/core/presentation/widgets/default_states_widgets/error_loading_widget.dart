import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../utils/gen/strings.g.dart';

/// Виджет для отображения ошибки
class ErrorLoadingWidget extends StatelessWidget {
  const ErrorLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        t.default_states.error,
        style: context.textStyles.regularTextStyles.montserrat14.copyWith(
          color: context.colors.mainColors.primary,
        ),
      ),
    );
  }
}
