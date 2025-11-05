import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../utils/constants/app_insets.dart';
import '../../utils/constants/app_sizes.dart';

/// Верхняя панель приложения.
class AppTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBarWidget({
    super.key,
    this.title,
    this.description,
    this.showBackButton = true,
    this.rightButton,
  });

  /// Заголовок экран
  final String? title;

  /// Описание экрана
  final String? description;

  /// Отображение кнопки наза
  final bool showBackButton;

  /// Кнопка справа
  final Widget? rightButton;

  /// Переходит на предыдущий экран
  Future<void> _goBack(BuildContext context) async => context.router.maybePop();

  @override
  Widget build(BuildContext context) {
    /// Получаем заголовок текущей страницы из [RouteData]
    final title = this.title ?? context.topRoute.title(context);

    return AppBar(
      backgroundColor: context.colors.mainColors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textStyles.regularTextStyles.montserrat20.copyWith(
              color: context.colors.mainColors.primary,
            ),
          ),
          Text(
            description ?? '',
            style: context.textStyles.regularTextStyles.montserrat12.copyWith(
              color: context.colors.mainColors.secondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      leading: showBackButton
          ? IconButton(
              onPressed: () async => _goBack(context),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: AppSizes.kIcon20,
                color: context.colors.mainColors.primary,
              ),
              padding: AppInsets.v20,
            )
          : null,
      actions: [
        if (rightButton != null)
          Padding(padding: AppInsets.right10, child: rightButton!),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
