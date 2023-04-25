import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveImagePicker extends ReactiveFormField<dynamic, List<XFile>> {
  HMReactiveImagePicker({
    Key? key,
    required String formControlName,
    bool Function(FormControl control)? showErrors,
    bool? isMultipleImage,
    void Function(List<XFile> images)? onChange,
    final List<ActionSheetItem> Function(
            bool isMultipleImage,
            ValueNotifier<List<XFile>> pickedImage,
            void Function() pickMultiImage,
            void Function(ImageSource source) pickSingleImage)?
        imageSourceList,
    final Widget Function(
            ValueNotifier<List<XFile>> images, bool isMutipleImage)?
        builder,
    bool hasCancelButton = true,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<dynamic, List<XFile>> field) {
              // make sure never to pass null value to the Counter widget.
              List<XFile> fieldValue = field.value ?? <XFile>[];

              return HMImagePicker(
                isMultipleImage: isMultipleImage ?? false,
                builder: builder,
                hasCancelButton: hasCancelButton,
                imageSourceList: imageSourceList,
                initialValues: fieldValue,
                onImageSelected: (images) {
                  field.didChange(fieldValue = images);
                  onChange?.call(images);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, List<XFile>> createState() =>
      ReactiveFormFieldState<dynamic, List<XFile>>();
}
