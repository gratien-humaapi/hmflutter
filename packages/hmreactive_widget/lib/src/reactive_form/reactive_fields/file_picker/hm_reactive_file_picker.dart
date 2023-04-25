import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveFilePicker extends ReactiveFormField<dynamic, List> {
  HMReactiveFilePicker({
    Key? key,
    required String formControlName,
    required bool fileViewInModal,
    bool Function(FormControl control)? showErrors,
    required bool isMultipleFiles,
    void Function(List<PlatformFile> files)? onChange,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<dynamic, List> field) {
              // make sure never to pass null value to the Counter widget.
              List fieldValue = field.value ?? [];

              return HMFilePiker(
                fileViewInModal: fileViewInModal,
                isMultipleFiles: isMultipleFiles,
                onFileSelected: (files) {
                  field.didChange(fieldValue = files);
                  onChange?.call(files);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, List> createState() =>
      ReactiveFormFieldState<dynamic, List>();
}
