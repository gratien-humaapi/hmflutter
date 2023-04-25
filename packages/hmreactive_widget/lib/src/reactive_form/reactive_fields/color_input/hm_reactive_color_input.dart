import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveColorInput extends ReactiveFormField<dynamic, String> {
  HMReactiveColorInput({
    Key? key,
    required String formControlName,
    double inputRadius = 8,
    bool Function(FormControl control)? showErrors,
    void Function(String color)? onChange,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<dynamic, String> field) {
              // make sure never to pass null value to the Counter widget.
              String fieldValue = field.value ?? "000000";

              return HMColorIpnut(
                initialColor: fieldValue,
                inputRadius: inputRadius,
                onColorChange: (String color) {
                  field.didChange(fieldValue = color);
                  onChange?.call(color);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, String> createState() =>
      ReactiveFormFieldState<dynamic, String>();
}
