import 'package:equatable/equatable.dart';

/// Модель ответственного за задачу
class ResponsibleModel extends Equatable {
  /// Конструктор
  const ResponsibleModel({this.id, required this.name, required this.phone});

  /// Идентификатор ответственного
  final int? id;

  /// Имя ответственного
  final String name;

  /// Телефон ответственного
  final String phone;

  static const ResponsibleModel empty = ResponsibleModel(
    id: null,
    name: '',
    phone: '',
  );

  /// Флаг, указывающий, является ли форма ответственного заполненной
  bool get isValid => name.trim().isNotEmpty && phone.trim().isNotEmpty;

  /// Копирование с новыми значениями
  ResponsibleModel copyWith({int? id, String? name, String? phone}) {
    return ResponsibleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [id, name, phone];
}
