import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class RadioProps extends ActionsPropsBase {
  RadioProps({
    bool disabled = false,
    bool hidden = false,
    required this.radioList,
    this.size,
    this.value,
    this.isLeft,
    this.boxRadius,
    this.textColor,
    this.radioColor = const Color.fromARGB(255, 121, 80, 242),
    this.onChange,
    this.isToggleable = false,
  }) : super(disabled, hidden);
  final HMRadioSize? size;
  final Color? radioColor;
  final Color? textColor;

  /// The position of the icon on the line
  ///`"true"` to put the icon before the title
  ///and `"false"`to put the icon to end.
  final bool? isLeft;
  final dynamic value;
  final List radioList;
  final HMRadius? boxRadius;
  final bool isToggleable;
  final void Function(dynamic value)? onChange;
}
