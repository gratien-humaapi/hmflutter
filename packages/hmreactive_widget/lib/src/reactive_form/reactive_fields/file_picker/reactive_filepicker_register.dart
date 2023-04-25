// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveFilePickerRegister(HMFormBuilder builder) {
  builder.defineWidget(FilePickerProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as FilePickerProps;
    return HMReactiveFilePicker(
      formControlName: props.fieldKey,
      fileViewInModal: customProps.fileViewInModal,
      isMultipleFiles: customProps.isMultipleFiles,
      onChange: customProps.onChange,
    );
  });
}
