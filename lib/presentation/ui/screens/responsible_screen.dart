import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../../core/presentation/widgets/app_bottom_sheet.dart';
import '../../../core/presentation/widgets/app_top_bar_widget.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/enums/states_enums.dart';
import '../../../core/utils/gen/strings.g.dart';
import '../../providers/get_responsible_provider.dart';
import '../../states/get_responsible_state.dart';
import '../widgets/add_responsible_widget.dart';
import '../widgets/responsible_item_widget.dart';

/// Экран выбора ответственного
@RoutePage()
class ResponsibleScreen extends ConsumerStatefulWidget {
  const ResponsibleScreen({super.key});

  @override
  ConsumerState<ResponsibleScreen> createState() => _ResponsibleScreenState();
}

class _ResponsibleScreenState extends ConsumerState<ResponsibleScreen> {
  @override
  void initState() {
    super.initState();
    // Загружаем список при первом открытии экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getResponsibleProvider.notifier).fetchResponsibles();
    });
  }

  /// Показывает bottom sheet для добавления ответственного
  Future<void> _showAddResponsibleBottomSheet(BuildContext context) async {
    await AppBottomSheet.show(context, child: const AddResponsibleWidget());
  }

  @override
  Widget build(BuildContext context) {
    // читаем состояние провайдера
    final state = ref.watch(getResponsibleProvider);

    return Scaffold(
      appBar: AppTopBarWidget(
        showBackButton: true,
        description: t.screen_titles.responsible.description,
        rightButton: IconButton(
          onPressed: () => _showAddResponsibleBottomSheet(context),
          icon: Icon(
            Icons.add,
            size: AppSizes.kIcon24,
            color: context.colors.mainColors.primary,
          ),
        ),
      ),
      body: _buildResponsibleBody(context, state),
    );
  }
}

Widget _buildResponsibleBody(BuildContext context, GetResponsibleState state) {
  /// Загрузка
  if (state is GetResponsibleLoading) {
    return StatesEnums.loading.widget;
  }

  /// Ошибка
  if (state is GetResponsibleError) {
    return StatesEnums.error.widget;
  }

  /// Пустой список
  if (state is GetResponsibleEmpty) {
    return StatesEnums.empty.widget;
  }

  /// Список ответственных
  if (state is GetResponsibleSuccess) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.responsibles.length,
      itemBuilder: (context, i) {
        final responsible = state.responsibles[i];
        return ResponsibleItemWidget(responsible: responsible);
      },
    );
  }

  return const SizedBox.shrink();
}
