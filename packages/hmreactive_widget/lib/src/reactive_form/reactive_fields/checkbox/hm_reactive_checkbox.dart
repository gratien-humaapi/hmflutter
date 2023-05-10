import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveCheckBox extends ReactiveFormField<dynamic, bool> {
  HMReactiveCheckBox({
    Key? key,
    required String formControlName,
    String? label,
    bool disabled = false,
    bool hidden = false,
    HMRadius? radius,
    ShowErrorsFunction<dynamic>? showErrors,
    HMCheckBoxSize? size,
    Color? color,
    void Function(bool value)? onChange,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors:
                showErrors ?? (control) => control.dirty && control.invalid,
            builder: (ReactiveFormFieldState<dynamic, bool> field) {
              // make sure never to pass null value to the Counter widget.
              Color? bColor = field.errorText != null ? Colors.red : null;
              return HMCheckBox(
                value: field.value ?? false,
                label: label,
                disabled: disabled,
                hidden: hidden,
                radius: radius,
                size: size,
                borderColor: bColor,
                color: color,
                onChange: (value) {
                  field.didChange(value);
                  // print(value);
                  onChange?.call(field.value!);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, bool> createState() =>
      ReactiveFormFieldState<dynamic, bool>();
}
