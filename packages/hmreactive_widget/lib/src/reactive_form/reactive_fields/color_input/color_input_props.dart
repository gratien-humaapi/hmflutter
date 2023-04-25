
import '../../props_base.dart';

class ColorInputProps extends ActionsPropsBase {
  ColorInputProps({
    bool disabled = false,
    bool hidden = false,
    this.inputRadius = 8,
    this.onChange,
  }) : super(disabled, hidden);
  final double inputRadius;
  final void Function(String color)? onChange;
}
