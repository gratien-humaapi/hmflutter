import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class RangeSliderProps extends PropsBase {
  RangeSliderProps({
    super.disabled,
      super.hidden,
    this.marks,
    this.orientation = HMOrientation.horizontal,
    required this.rangeValues,
    this.rangeMinValue = 0,
    this.rangeMaxValue = 100,
    this.color,
    this.radius,
    this.size = HMSliderSize.md,
    this.onChange,
  }) ;

  final List<HMSliderMark>? marks;
  final HMOrientation orientation;
  final RangeValues rangeValues;
  final double rangeMinValue;
  final double rangeMaxValue;
  final Color? color;
  final HMRadius? radius;
  final HMSliderSize? size;
  final void Function(List<int> value)? onChange;
}
