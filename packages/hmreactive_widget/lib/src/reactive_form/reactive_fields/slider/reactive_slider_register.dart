// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveSliderRegister(HMFormBuilder builder) {
  builder.defineWidget(SliderProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as SliderProps;
    return HMReactiveSlider(
      formControlName: props.fieldKey,
      disabled: customProps.disabled,
      hidden: customProps.hidden,
      showErrors: showErrors,
      size: customProps.size,
      marks: customProps.marks,
      orientation: customProps.orientation,
      min: customProps.min,
      max: customProps.max,
      color: customProps.color,
      radius: customProps.radius,
      onChange: customProps.onChange,
    );
  });
}
