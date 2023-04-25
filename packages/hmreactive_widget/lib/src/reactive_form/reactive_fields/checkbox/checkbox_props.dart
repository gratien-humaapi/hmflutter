import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class CheckBoxProps extends ActionsPropsBase {
  CheckBoxProps({
    bool disabled = false,
    bool hidden = false,
    this.color,
    this.radius,
    this.size = HMCheckBoxSize.md,
    this.label,
    this.onChange,
  }) : super(disabled, hidden);
  final String? label;

  Color? color;
  HMRadius? radius;
  HMCheckBoxSize size;
  final void Function(bool value)? onChange;
}
