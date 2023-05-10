import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class TextFieldProps extends PropsBase {
  TextFieldProps(
      {super.disabled,
      super.hidden,
      this.hintText,
      this.value = "",
      this.iconColor,
      this.label,
      this.maxLength,
      this.textFieldType,
      this.disabledTextColor,
      this.textInputAction = TextInputAction.done,
      this.keyboardType,
      this.suffixIcon,
      this.minLines = 2,
      this.maxLines = 4,
      this.onTap,
      this.onSubmitted,
      this.onChange,
      // this.onSubmitted,
      // this.onTap,
      this.description,
      this.prefixIcon,
      this.fillColor,
      this.disabledColor,
      this.isRequired = false,
      this.variant,
      this.size,
      this.radius});
  final String? hintText;
  final String value;
  final String? label;
  final String? description;
  final int? maxLength;
  final bool isRequired;
  final HMTextVariant? variant;
  final HMTextFieldSize? size;
  final HMRadius? radius;
  final Color? fillColor;
  final Color? iconColor;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final void Function()? onTap;
  final void Function(String value)? onChange;
  final void Function(String value)? onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final HMTextFieldType? textFieldType;
  final int minLines;
  final int maxLines;
}
