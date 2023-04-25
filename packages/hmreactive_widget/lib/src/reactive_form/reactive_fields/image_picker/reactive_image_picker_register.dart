// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveImagePickerRegister(HMFormBuilder builder) {
  builder.defineWidget(ImagePickerProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as ImagePickerProps;
    return HMReactiveImagePicker(
      formControlName: props.fieldKey,
      builder: customProps.builder,
      imageSourceList: customProps.imageSourceList,
      hasCancelButton: customProps.hasCancelButton,
      showErrors: showErrors,
      isMultipleImage: customProps.isMultipleImage,
      onChange: customProps.onChange,
    );
  });
}
