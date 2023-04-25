// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveCheckBoxRegister(HMFormBuilder builder) {
  builder.defineWidget(CheckBoxProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as CheckBoxProps;
    return HMReactiveCheckBox(
      formControlName: props.fieldKey,
      disabled: customProps.disabled,
      hidden: customProps.hidden,
      showErrors: showErrors,
      size: customProps.size,
      radius: customProps.radius,
      label: props.label ?? customProps.label,
      color: customProps.color,
      onChange: customProps.onChange,
    );
  });
}
