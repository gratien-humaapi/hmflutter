// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveRangeSliderRegister(HMFormBuilder builder) {
  builder.defineWidget(RangeSliderProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as RangeSliderProps;
    return HMReactiveRangeSlider(
      formControlName: props.fieldKey,
      size: customProps.size,
      radius: customProps.radius,
      showErrors: showErrors,
      color: customProps.color,
      rangeMaxValue: customProps.rangeMaxValue,
      rangeMinValue: customProps.rangeMinValue,
      rangeValues: customProps.rangeValues,
      orientation: customProps.orientation,
      marks: customProps.marks,
      onChange: customProps.onChange,
    );
  });
}
