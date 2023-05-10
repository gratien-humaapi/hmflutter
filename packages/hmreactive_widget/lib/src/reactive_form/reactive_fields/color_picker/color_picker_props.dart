import 'package:flutter/material.dart';

import '../../props_base.dart';

class ColorPickerProps extends PropsBase {
  ColorPickerProps({
    super.disabled,
    super.hidden,
    this.displayThumbColor = true,
    this.portraitOnly = false,
    this.enableAlpha = false,
    this.currentColor,
    this.hueRingStrokeWidth = 20.0,
    this.colorPickerHeight = 250.0,
    this.onChange,
  });
  final bool displayThumbColor;
  final bool enableAlpha;
  final void Function(Color color)? onChange;
  final bool portraitOnly;
  final double colorPickerHeight;
  final double hueRingStrokeWidth;
  final Color? currentColor;
}
