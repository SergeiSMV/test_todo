import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'colors/base_colors.dart';
import 'colors/main_colors.dart';

/// Класс [AppColors] содержит цветовую тему приложения.
/// Все изменения в цветовой теме производятся в этом классе.
@singleton
class AppColors extends BaseColors {
  const AppColors() : super(mainColors: const _MainColors());

  @override
  ThemeExtension<BaseColors> copyWith() => const AppColors();

  @override
  ThemeExtension<BaseColors> lerp(
    covariant ThemeExtension<BaseColors>? other,
    double t,
  ) => const AppColors();
}

class _MainColors extends MainColors {
  const _MainColors()
    : super(
        primary: const Color(0xFF673AB7),
        primaryLight: const Color.fromARGB(255, 224, 229, 255),
        secondary: const Color(0xFFD2C4E9),
        transparent: Colors.transparent,
        error: const Color(0xFFFF2600),
        white: const Color(0xFFFFFFFF),
        bottomSheetBlackout: const Color.fromRGBO(16, 16, 16, 0.9),
        shadow: const Color(0xFF000000),

        priorityColors: (
          low: const Color.fromARGB(255, 1, 197, 63),
          medium: const Color.fromARGB(255, 238, 172, 49),
          high: const Color.fromARGB(255, 191, 3, 3),
        ),
      );
}
