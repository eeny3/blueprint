import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/widgets/locale/locale_builder.dart';

/// Первичный поле ввода
class PrimaryTextField extends StatefulWidget {
  final String? value;
  final String? title;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double height;
  final double? borderRadius;
  final Border? border;
  final Color backgroundColor;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool isDisabled;
  final bool isReadOnly;
  final bool hasAutofocus;
  final bool isObscureText;
  final num? numLimit;
  final FocusNode? focusNode;
  final TextStyle? labelStyleOnDisabled;
  final BoxShadow? shadow;
  final InputDecoration decoration;
  final String? errorText;
  final bool hasError;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final TextStyle hintStyle;

  const PrimaryTextField({
    Key? key,
    required this.value,
    this.title,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.controller,
    this.onChange,
    this.height = 40,
    this.border,
    this.backgroundColor = blueAccent,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.hasAutofocus = false,
    this.isObscureText = false,
    this.numLimit,
    this.focusNode,
    this.labelStyleOnDisabled,
    this.shadow,
    this.keyboardType,
    this.decoration = const InputDecoration(),
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.onSubmitted,
    this.borderRadius,
    this.errorText,
    this.textAlign = TextAlign.start,
    this.hasError = false,
    this.hintStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Color(0xFF8FA4B2),
    ),
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late TextEditingController _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  @override
  void initState() {
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.value);
    }

    super.initState();
    _effectiveController.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _effectiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(builder: (_, getText) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(widget.title!),
            ),
          Container(
            width: double.infinity,
            height: widget.height,
            decoration: BoxDecoration(
              border: widget.hasError
                  ? Border.all(color: dangerColor)
                  : widget.border,
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 12.r)),
              color: widget.backgroundColor,
              boxShadow: const [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 112.r)),
              child: Center(
                child: TextField(
                  enabled: !widget.isDisabled,
                  maxLength: widget.maxLength,
                  controller: _effectiveController,
                  readOnly: widget.isReadOnly,
                  obscureText: widget.isObscureText,
                  keyboardType: widget.keyboardType,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  textInputAction: widget.textInputAction,
                  autofocus: widget.hasAutofocus,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF353333),
                  ),
                  textAlign: widget.textAlign,
                  decoration: widget.decoration.copyWith(
                      counterText: '',
                      isDense: true,
                      fillColor: Colors.transparent,
                      hintText: getText(widget.hintText ?? ''),
                      border: widget.decoration.border ?? InputBorder.none,
                      focusedBorder:
                          widget.decoration.focusedBorder ?? InputBorder.none,
                      contentPadding: widget.decoration.contentPadding ??
                          EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                      // errorText: widget.errorText,
                      errorStyle: const TextStyle(color: Colors.transparent),
                      errorBorder:
                          widget.decoration.errorBorder ?? InputBorder.none,
                      focusedErrorBorder:
                          widget.decoration.focusedErrorBorder ??
                              InputBorder.none,
                      disabledBorder:
                          widget.decoration.disabledBorder ?? InputBorder.none,
                      enabledBorder:
                          widget.decoration.enabledBorder ?? InputBorder.none,
                      labelText: widget.labelText,
                      helperText: null,
                      hintStyle: widget.hintStyle,
                      labelStyle: widget.hasError
                          ? TextStyle(color: dangerColor)
                          : widget.labelStyleOnDisabled ??
                              const TextStyle(fontWeight: FontWeight.w500),
                      suffixIcon: widget.decoration.suffixIcon),
                  inputFormatters: widget.inputFormatters,
                  onChanged: (value) => _handleControllerChanged,
                  onSubmitted: widget.onSubmitted,
                ),
              ),
            ),
          ),
          if (widget.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                widget.errorText ?? '',
                style: TextStyle(color: dangerColor),
              ),
            ),
        ],
      );
    });
  }

  void _handleControllerChanged() {
    if (_effectiveController.text.isEmpty && widget.value == null) {
      return;
    } else if (_effectiveController.text != widget.value) {
      widget.onChange!(_effectiveController.text);
    }
  }
}
