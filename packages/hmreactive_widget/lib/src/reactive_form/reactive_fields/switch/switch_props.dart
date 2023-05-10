import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class SwitchProps extends PropsBase {
  SwitchProps({
    super.disabled,
    super.hidden,
    this.duration,
    this.onLabel,
    this.offLabel,
    this.label,
    this.iconOn,
    this.iconOff,
    this.color,
    this.size,
    this.radius,
    // required this.value,
    this.onChange,
  });
  final Duration? duration;
  final String? onLabel;
  final String? offLabel;
  final String? label;
  final Widget? iconOn;
  final Widget? iconOff;
  final Color? color;
  final HMSwitchSize? size;
  final HMRadius? radius;
  // final bool value;
  final void Function(bool value)? onChange;
}
