import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'fieldmeta.dart';

class HMFormBuilder {
  Map<
          Type,
          Widget Function(FieldMeta props,
              bool Function(AbstractControl<Object?> control)? showErrors)>
      fieldMap = {};

  getField(FieldMeta fieldMeta,
      bool Function(AbstractControl<Object?> control)? showErrors) {
    final inputType = fieldMeta.customProps.runtimeType;
    // print(inputType);
    if (fieldMap[inputType] == null) {
      throw ErrorDescription(
          'Field $inputType not found, did you defined it by ');
    }
    final widget = fieldMap[inputType]!(fieldMeta, showErrors);
    return widget;
  }

  defineWidget(
      Type inputType,
      Widget Function(FieldMeta props,
              bool Function(AbstractControl<Object?> control)? showErrors)
          widget) {
    if (fieldMap[inputType] != null) return;
    fieldMap[inputType] = widget;
  }
}
