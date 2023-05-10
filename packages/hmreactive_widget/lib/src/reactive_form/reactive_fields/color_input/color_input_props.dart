import '../../props_base.dart';

class ColorInputProps extends PropsBase {
  ColorInputProps({
    super.disabled,
    super.hidden,
    this.inputRadius = 8,
    this.onChange,
  });
  final double inputRadius;
  final void Function(String color)? onChange;
}
