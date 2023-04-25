import 'package:flutter/material.dart';

import '../../props_base.dart';

class ColorPickerProps extends ActionsPropsBase {
  ColorPickerProps({
    bool disabled = false,
    bool hidden = false,
    this.displayThumbColor = true,
    this.portraitOnly = false,
    this.enableAlpha = false,
    this.currentColor,
    this.hueRingStrokeWidth = 20.0,
    this.colorPickerHeight = 250.0,
    this.onChange,
  }) : super(disabled, hidden);
  final bool displayThumbColor;
  final bool enableAlpha;
  final void Function(Color color)? onChange;
  final bool portraitOnly;
  final double colorPickerHeight;
  final double hueRingStrokeWidth;
  final Color? currentColor;
}
