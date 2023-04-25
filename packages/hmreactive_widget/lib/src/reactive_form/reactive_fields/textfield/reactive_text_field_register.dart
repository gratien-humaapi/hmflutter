// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveTextFieldRegister(HMFormBuilder builder) {
  // print("here");
  builder.defineWidget(TextFieldProps, (
    FieldMeta props,
    bool Function(AbstractControl<Object?> control)? showErrors,
  ) {
    final customProps = props.customProps as TextFieldProps;
    // final control = form.control(props['fieldKey'] as String);
    return HMReactiveTextField(
        formControlName: props.fieldKey,
        disabled: customProps.disabled,
        hidden: customProps.hidden,
        showErrors: showErrors,
        hintText: customProps.hintText,
        iconColor: customProps.iconColor,
        maxLength: customProps.maxLength,
        textFieldType: customProps.textFieldType,
        textInputAction: customProps.textInputAction,
        disabledColor: customProps.disabledColor,
        disabledTextColor: customProps.disabledTextColor,
        keyboardType: customProps.keyboardType,
        suffixIcon: customProps.suffixIcon,
        minLines: customProps.minLines,
        maxLines: customProps.maxLines,
        onChange: customProps.onChange,
        onSubmitted: customProps.onSubmitted,
        onTap: customProps.onTap,
        prefixIcon: customProps.prefixIcon,
        fillColor: customProps.fillColor,
        variant: customProps.variant,
        size: customProps.size,
        radius: customProps.radius,
        fieldMeta: props);
  });
}
