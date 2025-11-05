import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/ui/screens/my_tasks_screen.dart';
import '../../presentation/ui/screens/assigned_tasks_screen.dart';
import '../../presentation/ui/screens/add_task_screen.dart';
import '../../presentation/ui/screens/responsible_screen.dart';
import '../presentation/screens/navigation_screen.dart';
import '../utils/gen/strings.g.dart';
part 'app_router.gr.dart';

/// Главный роутер приложения ToDo List.
/// Управляет всеми маршрутами приложения.
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    /// Основной экран с вкладками (Мои задачи / От меня)
    AutoRoute(
      page: NavigationRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: MyTasksRoute.page,
          title: (_, __) => t.screen_titles.my_tasks.title,
        ),
        AutoRoute(
          page: AssignedTasksRoute.page,
          title: (_, __) => t.screen_titles.assigned_tasks.title,
        ),
      ],
    ),

    /// Форма создания / редактирования задачи
    AutoRoute(
      page: AddTaskRoute.page,
      title: (_, __) => t.task_form.app_bar.title,
    ),

    /// Экран управления ответственными
    AutoRoute(
      page: ResponsibleRoute.page,
      title: (_, __) => t.screen_titles.responsible.title,
    ),
  ];
}
