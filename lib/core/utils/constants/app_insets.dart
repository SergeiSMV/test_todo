import 'package:flutter/material.dart';

/// Константы для отступов
abstract final class AppInsets {
  //--- Vertical --------------------------------------------------------------
  static const EdgeInsets v5 = EdgeInsets.symmetric(vertical: 5);
  static const EdgeInsets v8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets v20 = EdgeInsets.symmetric(vertical: 20);

  //--- Right -----------------------------------------------------------------
  static const EdgeInsets right10 = EdgeInsets.only(right: 10);

  //--- Horizontal ------------------------------------------------------------
  static const EdgeInsets h12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets h20 = EdgeInsets.symmetric(horizontal: 20);

  //--- Top -------------------------------------------------------------------
  static const EdgeInsets top4 = EdgeInsets.only(top: 4);
  static const EdgeInsets top10 = EdgeInsets.only(top: 10);
  static const EdgeInsets top20 = EdgeInsets.only(top: 20);
  static const EdgeInsets top30 = EdgeInsets.only(top: 30);

  //--- Bottom ----------------------------------------------------------------
  static const EdgeInsets bottom8 = EdgeInsets.only(bottom: 8);
  static const EdgeInsets bottom20 = EdgeInsets.only(bottom: 20);
}
