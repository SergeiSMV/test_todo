/// Расширение для работы с датами в строковом формате
extension DateTimeStringFormatting on String {
  /// Преобразует строку даты из формата "2025-06-10 00:00:00" в "10.06.2025"
  String get toDDMMYYYY {
    try {
      final date = DateTime.tryParse(this);
      if (date == null) return this;

      final day = date.day.toString().padLeft(2, '0');
      final month = date.month.toString().padLeft(2, '0');
      final year = date.year;

      return '$day.$month.$year';
    } on Exception catch (_) {
      return this;
    }
  }
}
