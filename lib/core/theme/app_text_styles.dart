import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'text_styles/base_text_styles.dart';
import 'text_styles/bold_text_styles.dart';
import 'text_styles/regular_text_styles.dart';

/// Класс [AppTextStyles] содержит типографику приложения.
/// Все изменения в типографике производятся в этом классе.
@singleton
class AppTextStyles extends BaseTextStyles {
  const AppTextStyles()
    : super(
        regularTextStyles: const RegularTextStyles(),
        boldTextStyles: const BoldTextStyles(),
      );

  @override
  ThemeExtension<BaseTextStyles> copyWith() => const AppTextStyles();

  @override
  ThemeExtension<BaseTextStyles> lerp(
    covariant ThemeExtension<BaseTextStyles>? other,
    double t,
  ) => const AppTextStyles();
}
