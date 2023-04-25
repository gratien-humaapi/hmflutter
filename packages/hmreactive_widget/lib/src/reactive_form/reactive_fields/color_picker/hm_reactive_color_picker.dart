import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveColorPicker extends ReactiveFormField<dynamic, Color> {
  HMReactiveColorPicker({
    Key? key,
    required String formControlName,
    bool disabled = false,
    bool hidden = false,
    bool displayThumbColor = true,
    bool Function(FormControl control)? showErrors,
    bool portraitOnly = false,
    bool enableAlpha = false,
    double hueRingStrokeWidth = 20.0,
    double colorPickerHeight = 250.0,
    void Function(Color color)? onChange,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<dynamic, Color> field) {
              // make sure never to pass null value to the Counter widget.
              Color fieldValue = field.value ?? Colors.black;

              return HMColorPicker(
                currentColor: fieldValue,
                disabled: disabled,
                hidden: hidden,
                displayThumbColor: displayThumbColor,
                portraitOnly: portraitOnly,
                enableAlpha: enableAlpha,
                hueRingStrokeWidth: hueRingStrokeWidth,
                colorPickerHeight: colorPickerHeight,
                onColorChanged: (Color color) {
                  field.didChange(fieldValue = color);
                  onChange?.call(color);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, Color> createState() =>
      ReactiveFormFieldState<dynamic, Color>();
}
