import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/constants/app_boxes.dart';
import 'package:todo_list/core/utils/constants/app_insets.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/utils/constants/app_borders.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../../domain/models/responsible_model.dart';

/// Виджет для отображения ответственного
class ResponsibleItemWidget extends StatelessWidget {
  const ResponsibleItemWidget({super.key, required this.responsible});

  /// Модель ответственного
  final ResponsibleModel responsible;

  /// Проверка, является ли ответственный "пользователь"
  bool get isSelf => responsible.name == "пользователь";

  /// Получить описание
  String? _getDescription() {
    return isSelf ? t.screen_titles.responsible_item.description : null;
  }

  /// выбор ответственного
  Future<void> _selectResponsible(BuildContext context) async {
    context.router.pop(responsible);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.v8,
      child: InkWell(
        onTap: () => _selectResponsible(context),
        child: Container(
          padding: AppInsets.h12 + AppInsets.v5,
          decoration: BoxDecoration(
            color: isSelf
                ? context.colors.mainColors.primaryLight
                : context.colors.mainColors.white,
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
              Icon(
                Icons.person,
                size: AppSizes.kIcon24,
                color: context.colors.mainColors.primary,
              ),
              AppBoxes.kWidth10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    responsible.name,
                    style: context.textStyles.regularTextStyles.montserrat14
                        .copyWith(color: context.colors.mainColors.primary),
                  ),
                  if (_getDescription() != null)
                    Text(
                      _getDescription()!,
                      style: context.textStyles.regularTextStyles.montserrat12
                          .copyWith(color: context.colors.mainColors.white),
                    ),

                  if (responsible.phone.isNotEmpty)
                    Text(
                      "телефон: ${responsible.phone}",
                      style: context.textStyles.regularTextStyles.montserrat14
                          .copyWith(color: context.colors.mainColors.secondary),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
