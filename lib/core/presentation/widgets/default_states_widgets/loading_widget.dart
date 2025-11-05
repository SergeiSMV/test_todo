import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../utils/constants/app_boxes.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/gen/strings.g.dart';

/// Виджет для отображения загрузки
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSizes.kIcon20,
            width: AppSizes.kIcon20,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              color: context.colors.mainColors.primary,
            ),
          ),
          AppBoxes.kHeight10,
          Text(
            t.default_states.loading,
            style: context.textStyles.regularTextStyles.montserrat14.copyWith(
              color: context.colors.mainColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
