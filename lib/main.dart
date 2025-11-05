import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'presentation/ui/app.dart';

Future<void> main() async {
  /// Инициализация WidgetsFlutterBinding
  WidgetsFlutterBinding.ensureInitialized();

  /// Инициализация зависимостей
  await setupDependencies();

  /// Запуск приложения
  runApp(const ToDoApp());
}
