// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveRadioRegister(HMFormBuilder builder) {
  builder.defineWidget(RadioProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as RadioProps;
    return HMReactiveRadio(
      formControlName: props.fieldKey,
      size: customProps.size,
      showErrors: showErrors,
      radioColor: customProps.radioColor,
      textColor: customProps.textColor,
      isLeft: customProps.isLeft,
      radioList: customProps.radioList,
      boxRadius: customProps.boxRadius,
      onChange: customProps.onChange,
    );
  });
}
