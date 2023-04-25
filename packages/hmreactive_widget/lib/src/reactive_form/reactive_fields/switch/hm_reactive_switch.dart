import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveSwitch extends ReactiveFormField<dynamic, bool> {
  HMReactiveSwitch({
    Key? key,
    required String formControlName,
    bool? disabled,
    bool? hidden,
    Duration? duration,
    String? onLabel,
    String? offLabel,
    String? label,
    Widget? iconOn,
    ShowErrorsFunction<dynamic>? showErrors,
    Widget? iconOff,
    FocusNode? focusNode,
    Color? color,
    HMSwitchSize? size,
    HMRadius? radius,
    void Function(bool value)? onChange,
    // required bool value,
  }) : super(
            key: key,
            formControlName: formControlName,
            focusNode: focusNode,
            showErrors:
                showErrors ?? (control) => control.dirty && control.invalid,
            builder: (ReactiveFormFieldState<dynamic, bool> field) {
              // make sure never to pass null value to the Counter widget.
              Color? bColor = field.errorText != null ? Colors.red : null;
              return HMSwitch(
                value: field.value ?? false,
                disabled: disabled ?? !field.control.enabled,
                hidden: hidden ?? false,
                duration: duration,
                onLabel: onLabel,
                borderColor: bColor,
                offLabel: offLabel,
                label: label,
                iconOff: iconOff,
                iconOn: iconOn,
                color: color,
                size: size,
                radius: radius,
                onChange: (value) {
                  field.didChange(value);
                  onChange?.call(value);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, bool> createState() =>
      ReactiveFormFieldState<dynamic, bool>();
}
