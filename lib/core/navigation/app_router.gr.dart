// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddTaskScreen]
class AddTaskRoute extends PageRouteInfo<void> {
  const AddTaskRoute({List<PageRouteInfo>? children})
    : super(AddTaskRoute.name, initialChildren: children);

  static const String name = 'AddTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddTaskScreen();
    },
  );
}

/// generated route for
/// [AssignedTasksScreen]
class AssignedTasksRoute extends PageRouteInfo<void> {
  const AssignedTasksRoute({List<PageRouteInfo>? children})
    : super(AssignedTasksRoute.name, initialChildren: children);

  static const String name = 'AssignedTasksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AssignedTasksScreen();
    },
  );
}

/// generated route for
/// [MyTasksScreen]
class MyTasksRoute extends PageRouteInfo<void> {
  const MyTasksRoute({List<PageRouteInfo>? children})
    : super(MyTasksRoute.name, initialChildren: children);

  static const String name = 'MyTasksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyTasksScreen();
    },
  );
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NavigationScreen());
    },
  );
}

/// generated route for
/// [ResponsibleScreen]
class ResponsibleRoute extends PageRouteInfo<void> {
  const ResponsibleRoute({List<PageRouteInfo>? children})
    : super(ResponsibleRoute.name, initialChildren: children);

  static const String name = 'ResponsibleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResponsibleScreen();
    },
  );
}
