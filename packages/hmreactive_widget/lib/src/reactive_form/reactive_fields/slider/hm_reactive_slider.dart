import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveSlider<T> extends ReactiveFormField<T, int> {
  HMReactiveSlider({
    bool disabled = false,
    bool hidden = false,
    List<HMSliderMark>? marks,
    HMOrientation orientation = HMOrientation.horizontal,
    double? min,
    double? max,
    bool Function(FormControl control)? showErrors,
    Color? color,
    HMRadius? radius,
    HMSliderSize size = HMSliderSize.md,
    Key? key,
    required String formControlName,
    void Function(dynamic value)? onChange,
  }) : super(
          key: key,
          formControlName: formControlName,
          showErrors: showErrors,
          builder: (ReactiveFormFieldState<T, int> field) {
            // make sure never to pass null value to the Counter widget.
            int fieldValue = field.value ?? 0;

            return HMSlider(
              value: fieldValue,
              disabled: disabled,
              hidden: hidden,
              marks: marks,
              orientation: orientation,
              max: max,
              min: min,
              color: color,
              radius: radius,
              size: size,
              onChange: (value) {
                field.didChange(fieldValue = value);
                onChange?.call(value);
              },
            );
          },
        );

  @override
  ReactiveFormFieldState<T, int> createState() =>
      ReactiveFormFieldState<T, int>();
}
