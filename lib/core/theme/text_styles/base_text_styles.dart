import 'package:flutter/material.dart';

import 'bold_text_styles.dart';
import 'regular_text_styles.dart';

/// Базовая типографика приложения (размеры шрифтов, межстрочные интервалы, etc)
abstract class BaseTextStyles extends ThemeExtension<BaseTextStyles> {
  const BaseTextStyles({
    required this.regularTextStyles,
    required this.boldTextStyles,
  });

  final RegularTextStyles regularTextStyles;
  final BoldTextStyles boldTextStyles;
}
