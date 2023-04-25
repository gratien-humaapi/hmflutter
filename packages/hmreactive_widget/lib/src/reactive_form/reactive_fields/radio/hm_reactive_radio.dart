import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveRadio<T> extends ReactiveFormField<T, String> {
  HMReactiveRadio({
    bool disabled = false,
    bool hidden = false,
    required List<dynamic> radioList,
    HMRadioSize? size,
    bool? isLeft,
    Widget? divider,
    HMRadius? boxRadius,
    bool Function(FormControl control)? showErrors,
    Color? textColor,
    Color? radioColor,
    required String formControlName,
    Key? key,
    void Function(dynamic value)? onChange,
  }) : super(
            key: key,
            showErrors: showErrors,
            formControlName: formControlName,
            builder: (ReactiveFormFieldState<T, String> field) {
              // make sure never to pass null value to the Counter widget.
              String fieldValue = field.value ?? "";

              return HMRadio(
                  disabled: disabled,
                  hidden: hidden,
                  value: fieldValue,
                  isLeft: isLeft,
                  radioList: radioList,
                  divider: divider,
                  size: size,
                  boxRadius: boxRadius,
                  textColor: textColor,
                  onChanged: (dynamic value) {
                    field.didChange(fieldValue = value);
                    onChange?.call(value);
                  });
            });

  @override
  ReactiveFormFieldState<T, String> createState() =>
      ReactiveFormFieldState<T, String>();
}
