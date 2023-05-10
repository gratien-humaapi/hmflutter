import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FieldGroup {
  String groupName;
  List<FieldMeta> fieldsMeta;
  final EdgeInsets? padding;
  final EdgeInsets? childPadding;
  final EdgeInsets? margin;
  final List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>?
      validators;

  FieldGroup({
    required this.groupName,
    required this.fieldsMeta,
    this.validators,
    this.padding,
    this.margin,
    this.childPadding,
  }) : assert(fieldsMeta.isNotEmpty, "you cannot generate empty form");
}

class FieldMeta<T> {
  String fieldKey;
  String? label;
  Map<String, ValidationMessageFunction>? validationMessages;
  String? fieldName;
  String? helperText;
  bool subscribe = true;
  dynamic defaultValue;
  List<Map<String, dynamic>? Function(AbstractControl<dynamic>)> options;
  T? customProps;
  FieldMeta(
      {required this.fieldKey,
      this.label,
      this.fieldName,
      this.validationMessages,
      required this.subscribe,
      required this.options,
      this.defaultValue,
      this.customProps});
  //     : assert(T == TestProps ? type == "text" : false,
  // //           "type must be a text")
  // {
  //   defaultValue = type == "checkBox" ? false : "";
  //   // print(T);

  //   // print(TestProps().runtimeType);
  // }
}
