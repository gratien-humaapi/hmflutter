// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveColorPickerRegister(HMFormBuilder builder) {
  builder.defineWidget(ColorPickerProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as ColorPickerProps;
    return HMReactiveColorPicker(
      formControlName: props.fieldKey,
      disabled: customProps.disabled,
      hidden: customProps.hidden,
      displayThumbColor: customProps.displayThumbColor,
      portraitOnly: customProps.portraitOnly,
      enableAlpha: customProps.enableAlpha,
      hueRingStrokeWidth: customProps.hueRingStrokeWidth,
      colorPickerHeight: customProps.colorPickerHeight,
      onChange: customProps.onChange,
    );
  });
}
