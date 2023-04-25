// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveSwitchRegister(HMFormBuilder builder) {
  builder.defineWidget(SwitchProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as SwitchProps;
    return HMReactiveSwitch(
      formControlName: props.fieldKey,
      size: customProps.size,
      duration: customProps.duration,
      showErrors: showErrors,
      onLabel: customProps.onLabel,
      offLabel: customProps.offLabel,
      label: props.label ?? customProps.label,
      iconOn: customProps.iconOn,
      iconOff: customProps.iconOff,
      color: customProps.color,
      radius: customProps.radius,
      onChange: customProps.onChange,
      hidden: customProps.hidden,
      disabled: customProps.disabled,
    );
  });
}
