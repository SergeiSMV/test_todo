import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../core/di/di.dart';
import '../../core/navigation/app_router.dart';
import '../../core/logger/talker_logger.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Главный виджет приложения
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // Получаем зависимости из DI
  static final AppRouter _appRouter = getIt<AppRouter>();
  static final IAppLogger _appLogger = getIt<IAppLogger>();
  static final AppColors _appColors = getIt<AppColors>();
  static final AppTextStyles _appTextStyles = getIt<AppTextStyles>();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        TalkerRiverpodObserver(
          talker: _appLogger.talker,
          settings: const TalkerRiverpodLoggerSettings(
            enabled: true,
            printProviderAdded: true,
            printProviderDisposed: false,
            printProviderUpdated: true,
            printProviderFailed: true,
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ru', 'RU'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru', 'RU')],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          extensions: [_appColors, _appTextStyles],
        ),
        routerConfig: _appRouter.config(
          navigatorObservers: () => [TalkerRouteObserver(_appLogger.talker)],
        ),
      ),
    );
  }
}
