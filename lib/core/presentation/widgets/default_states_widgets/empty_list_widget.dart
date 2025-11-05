import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../utils/gen/strings.g.dart';

/// Виджет для отображения пустого списка
class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        t.default_states.empty_list,
        style: context.textStyles.regularTextStyles.montserrat14.copyWith(
          color: context.colors.mainColors.primary,
        ),
      ),
    );
  }
}
