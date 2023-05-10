import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class CheckBoxProps extends PropsBase {
  CheckBoxProps({
    super.disabled,
    super.hidden,
    this.color,
    this.radius,
    this.size = HMCheckBoxSize.md,
    this.label,
    this.onChange,
  });
  final String? label;

  Color? color;
  HMRadius? radius;
  HMCheckBoxSize size;
  final void Function(bool value)? onChange;
}
