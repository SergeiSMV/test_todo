import 'package:flutter/material.dart';

/// Константы для границ.
abstract final class AppBorders {
  //--- Circular --------------------------------------------------------------
  static const BorderRadius kCircular5 = BorderRadius.all(Radius.circular(5));

  //--- Top Left --------------------------------------------------------------
  static const BorderRadius kTopLeft20 = BorderRadius.only(
    topLeft: Radius.circular(20),
  );

  //--- Top Right -------------------------------------------------------------
  static const BorderRadius kTopRight20 = BorderRadius.only(
    topRight: Radius.circular(20),
  );

  //--- All -------------------------------------------------------------------
  static const BorderRadius kAll8 = BorderRadius.all(Radius.circular(8));
}
