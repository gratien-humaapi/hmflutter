import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveRangeSlider<T> extends ReactiveFormField<T, List> {
  HMReactiveRangeSlider({
    Key? key,
    required String formControlName,
    bool disabled = false,
    bool hidden = false,
    List<HMSliderMark>? marks,
    HMOrientation orientation = HMOrientation.horizontal,
    RangeValues? rangeValues,
    double rangeMinValue = 0,
    bool Function(FormControl control)? showErrors,
    double rangeMaxValue = 100,
    Color? color,
    HMRadius? radius,
    HMSliderSize? size,
    void Function(List<int> value)? onChange,
  }) : super(
          key: key,
          formControlName: formControlName,
          showErrors: showErrors,
          builder: (ReactiveFormFieldState<T, List> field) {
            List fieldValue = field.value ?? [0, 100];

            return HMRangeSlider(
              rangeValues:
                  RangeValues(fieldValue.first * 1.0, fieldValue.last * 1.0),
              disabled: disabled,
              hidden: hidden,
              marks: marks,
              orientation: orientation,
              rangeMaxValue: rangeMaxValue,
              rangeMinValue: rangeMinValue,
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
  ReactiveFormFieldState<T, List> createState() =>
      ReactiveFormFieldState<T, List>();
}
