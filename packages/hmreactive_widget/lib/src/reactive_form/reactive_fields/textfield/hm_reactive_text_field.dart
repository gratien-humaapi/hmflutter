import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class HMReactiveTextField<T> extends ReactiveFormField<T, String> {
  final TextEditingController? _textController;
  HMReactiveTextField({
    Key? key,
    required FieldMeta fieldMeta,
    required String formControlName,
    FormControl<T>? formControl,
    Map<String, ValidationMessageFunction>? validationMessages,
    bool Function(AbstractControl<Object?> control)? showErrors,
    TextEditingController? controller,
    FocusNode? focusNode,
    bool? disabled,
    bool? hidden,
    String? hintText,
    Color? iconColor,
    Color? borderColor,
    Color? disabledTextColor,
    Color? disabledColor,
    int? maxLength,
    HMTextFieldType? textFieldType,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    int minLines = 2,
    int maxLines = 4,
    void Function(String)? onChange,
    void Function(String)? onSubmitted,
    void Function()? onTap,
    Widget? prefixIcon,
    Color? fillColor,
    HMTextVariant? variant,
    HMTextFieldSize? size,
    HMRadius? radius,
  })  : _textController = controller,
        super(
            key: key,
            formControl: formControl,
            formControlName: formControlName,
            showErrors: showErrors,
            focusNode: focusNode,
            builder: (ReactiveFormFieldState<T, String> field) {
              // String? fieldValue = field.value;
              final state = field as _HMReactiveTextFieldSTate<T>;
              var bColor = state.control.hasErrors && state.control.dirty
                  ? Colors.red
                  : borderColor;
              // print(field.errorText);
              return InputWrapper(
                fieldMeta: fieldMeta,
                showErrors: showErrors,
                input: HMTextField(
                  value: state.value,
                  disabled: disabled ?? !field.control.enabled,
                  controller: state._textController,
                  hidden: hidden ?? false,
                  focusNode: state.focusNode,
                  iconColor: iconColor,
                  maxLength: maxLength,
                  textFieldType: textFieldType,
                  textInputAction: textInputAction,
                  disabledTextColor: disabledTextColor,
                  disabledColor: disabledColor,
                  keyboardType: keyboardType,
                  suffixIcon: suffixIcon,
                  minLines: minLines,
                  maxLines: maxLines,
                  borderColor: bColor,
                  prefixIcon: prefixIcon,
                  hintText: hintText,
                  fillColor: fillColor,
                  variant: variant,
                  size: size,
                  radius: radius,
                  onChange: (value) {
                    field.didChange(value);
                    if (onChange != null) {
                      // print(value);
                      onChange(value);
                    }
                    // print('onChange $value');
                  },
                  onTap: onTap,
                  onSubmitted: (value) {
                    field.didChange(value);
                    if (onSubmitted != null) {
                      onSubmitted(value);
                    }
                    // print('onSubmitted : $value');
                  },
                ),
              );
            });

  @override
  ReactiveFormFieldState<T, String> createState() =>
      _HMReactiveTextFieldSTate<T>();
}

class _HMReactiveTextFieldSTate<T>
    extends ReactiveFocusableFormFieldState<T, String> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
  }

  @override
  void onControlValueChanged(dynamic value) {
    final effectiveValue = (value == null) ? '' : value.toString();
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  @override
  ControlValueAccessor<T, String> selectValueAccessor() {
    if (control is FormControl<int>) {
      return IntValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<double>) {
      return DoubleValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<DateTime>) {
      return DateTimeValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<TimeOfDay>) {
      return TimeOfDayValueAccessor() as ControlValueAccessor<T, String>;
    }

    return super.selectValueAccessor();
  }

  void _initializeTextController() {
    final initialValue = value;
    final currentWidget = widget as HMReactiveTextField<T>;
    _textController = (currentWidget._textController != null)
        ? currentWidget._textController!
        : TextEditingController();
    _textController.text = initialValue == null ? '' : initialValue.toString();
  }
}
