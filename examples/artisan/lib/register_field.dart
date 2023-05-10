import 'package:hmreactive_widget/hmreactive_widget.dart';

// final builder = HMFormBuilder();

// defineReativeField(HMFormBuilder builder) {
defineReativeField(HMFormBuilder builder) {
  ReactiveTextFieldRegister(builder);
  ReactiveImagePickerRegister(builder);
  ReactiveMultiSelectRegister(builder);
  ReactiveAutocompleteRegister(builder);
  ReactiveSelectRegister(builder);
}
