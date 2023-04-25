// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveColorInputRegister(HMFormBuilder builder) {
  builder.defineWidget(ColorInputProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as ColorInputProps;
    return HMReactiveColorInput(
      formControlName: props.fieldKey,
      showErrors: showErrors,
      inputRadius: customProps.inputRadius,
      onChange: customProps.onChange,
    );
  });
}
