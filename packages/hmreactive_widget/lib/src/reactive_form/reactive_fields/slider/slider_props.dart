import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class SliderProps extends ActionsPropsBase {
  SliderProps({
    bool disabled = false,
    bool hidden = false,
    this.color,
    this.orientation = HMOrientation.horizontal,
    this.marks = const [],
    this.size = HMSliderSize.md,
    this.min = 0.0,
    this.max = 100.0,
    this.radius,
    this.onChange,
  }) : super(disabled, hidden);
  List<HMSliderMark> marks;
  HMOrientation orientation;

  double? min;
  double? max;

  Color? color;
  HMRadius? radius;
  HMSliderSize size;
  final void Function(dynamic value)? onChange;
}
