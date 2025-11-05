import 'package:flutter/material.dart';

import '../../../../../../../core/utils/constants/app_borders.dart';
import '../../../../../../../core/utils/constants/app_boxes.dart';
import '../../../../../../../core/utils/constants/app_insets.dart';
import '../../../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../../../core/utils/extensions/build_context_ext.dart';
import '../../theme/textfield_theme.dart';

/// Типовой виджет ввода текста
/// [required] - флаг, указывающий, является ли поле обязательным
/// [title] - заголовок поля ввода
/// [hintText] - подсказка поля ввода
class TextFieldDefaultWidget extends StatefulWidget {
  const TextFieldDefaultWidget({
    this.onValueChanged,
    super.key,
    this.error,
    this.title,
    this.hintText,
    this.isRequired = true,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.isMultiline = false,
    this.readOnly = false,
    this.onTap,
  });

  /// Callback для блока для изменения текста в поле ввода
  final ValueChanged<String>? onValueChanged;

  /// Текст ошибки валидации
  final String? error;

  /// Заголовок поля ввода
  final String? title;

  /// Подсказка поля ввода
  final String? hintText;

  /// Флаг, указывающий, является ли поле обязательным
  final bool isRequired;

  /// Начальное значение поля ввода
  final String? initialValue;

  /// Тип клавиатуры
  final TextInputType keyboardType;

  /// Флаг, указывающий, является ли поле многострочным
  final bool isMultiline;

  /// Флаг, указывающий, является ли поле только для чтения
  final bool readOnly;

  /// Callback для блока для нажатия на поле ввода
  final Function()? onTap;

  @override
  State<TextFieldDefaultWidget> createState() => _TextFieldDefaultWidgetState();
}

class _TextFieldDefaultWidgetState extends State<TextFieldDefaultWidget> {
  /// Контроллер для управления текстом в поле ввода
  late final TextEditingController _controller;

  /// Фокусный узел
  late final FocusNode _focusNode;

  /// Геттер для текста ошибки валидации
  String? get _validationError => widget.error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(_onTextChanged);
    _focusNode = FocusNode();
    _initStateValue();
  }

  /// Инициализация начального состояния callback
  void _initStateValue() {
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      // Откладываем вызов callback после построения виджета
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onValueChanged?.call(widget.initialValue!);
      });
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Обработчик изменения текста в поле ввода
  void _onTextChanged() {
    final text = _controller.text;
    widget.onValueChanged?.call(text);
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      // Заголовок поля
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.title ?? '',
              style: context.textStyles.regularTextStyles.montserrat12.copyWith(
                color: context.colors.mainColors.primary,
              ),
            ),
            if (widget.isRequired)
              TextSpan(
                text: ' *',
                style: context.textStyles.regularTextStyles.montserrat14
                    .copyWith(color: context.colors.mainColors.error),
              ),
          ],
        ),
      ),
      // Отступ между заголовком и полем ввода
      AppBoxes.kHeight5,
      SizedBox(
        height: widget.isMultiline ? null : AppSizes.kTextFieldHeight,
        child: TextField(
          onTap: () => widget.onTap?.call(),
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          controller: _controller,
          keyboardType: widget.keyboardType,
          minLines: widget.isMultiline ? 1 : null,
          maxLines: widget.isMultiline ? 7 : 1,
          textInputAction: widget.isMultiline ? TextInputAction.newline : null,
          style: context.textStyles.regularTextStyles.montserrat14.copyWith(
            color: context.colors.mainColors.primary,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: context.colors.mainColors.white,
            hintText: widget.hintText ?? '',
            hintStyle: context.textStyles.regularTextStyles.montserrat14
                .copyWith(color: context.colors.mainColors.secondary),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppBorders.kCircular5,
              borderSide: BorderSide(
                color: TextFieldTheme.focusedBorderColor(
                  context,
                  _validationError,
                ),
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppBorders.kCircular5,
              borderSide: BorderSide(
                color: TextFieldTheme.enabledBorderColor(
                  context,
                  _validationError,
                  _controller.text,
                ),
                width: TextFieldTheme.enabledBorderWidth(
                  context,
                  _validationError,
                  _controller.text,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: AppBorders.kCircular5,
              borderSide: BorderSide(
                color: TextFieldTheme.borderColor(context, _validationError),
                width: TextFieldTheme.borderWidth(context, _validationError),
              ),
            ),
            contentPadding: AppInsets.h12 + AppInsets.top10,
          ),
        ),
      ),
      // Показываем текст ошибки если он есть
      if (_validationError != null)
        Padding(
          padding: AppInsets.top4,
          child: Text(
            _validationError!,
            style: context.textStyles.regularTextStyles.montserrat12.copyWith(
              color: context.colors.mainColors.error,
            ),
          ),
        ),
    ],
  );
}
