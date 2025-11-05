import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:todo_list/core/navigation/app_router.dart';
import 'package:todo_list/core/utils/constants/other_constants.dart';
import 'package:todo_list/core/utils/extensions/build_context_ext.dart';

import '../../di/di.dart';
import '../../../../core/logger/talker_logger.dart';
import '../../utils/gen/strings.g.dart';

/// Главная страница [NavigationScreen],
/// управляющая внутренней навигацией приложения ToDo List.
///
/// Содержит вкладки: "Мои задачи" и "Задачи от меня".
@RoutePage()
class NavigationScreen extends StatefulWidget implements AutoRouteWrapper {
  const NavigationScreen({super.key});

  /// Вкладки приложения
  static List<PageRouteInfo> get _routes => const [
    MyTasksRoute(),
    AssignedTasksRoute(),
  ];

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // Если понадобится обернуть в MultiBlocProvider — добавить здесь.
    return this;
  }
}

class _NavigationScreenState extends State<NavigationScreen> {
  /// Открывает экран с логами Talker.
  Future<void> _showLogs(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TalkerScreen(talker: getIt<IAppLogger>().talker),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: context.colors.mainColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: AutoTabsScaffold(
        routes: NavigationScreen._routes,
        animationDuration: OtherConstants.kDurationML200,
        transitionBuilder: (context, child, animation) =>
            FadeTransition(opacity: animation, child: child),
        bottomNavigationBuilder: (context, tabsRouter) => Theme(
          data: Theme.of(context).copyWith(
            scaffoldBackgroundColor: context.colors.mainColors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: context.colors.mainColors.white,
            ),
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedItemColor: context.colors.mainColors.primary,
            unselectedItemColor: context.colors.mainColors.secondary,
            elevation: 0,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_outlined),
                label: t.bottom_nav_bar.my_tasks,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_ind_outlined),
                label: t.bottom_nav_bar.assigned_tasks,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showLogs(context),
          tooltip: 'Показать логи',
          child: const Icon(Icons.bug_report),
        ),
      ),
    );
  }
}
