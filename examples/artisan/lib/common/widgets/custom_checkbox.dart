import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomCheckbox extends HookWidget {
  // final CheckBoxProps customProps;
  const CustomCheckbox({
    super.key,
    this.disabled = false,
    this.radius,
    this.checkIconColor,
    this.borderColor,
    required this.value,
    this.color,
    required this.onChange,
  });
  final bool disabled;
  final bool value;
  final Color? color;
  final Color? borderColor;
  final Color? checkIconColor;
  final double? radius;
  final void Function(bool value) onChange;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 200));
    final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    value ? controller.forward() : controller.reverse();
    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: () {
          // isChecked.value = !isChecked.value;
          onChange(!value);
        },
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: disabled
                ? const Color(0xFFE4E5E6)
                : value
                    ? color ?? Colors.blue
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(radius ?? 6),
            border: value
                ? null
                : Border.all(
                    color: borderColor ?? const Color(0xFF848484), width: 1),
          ),
          child: Center(
            child: ScaleTransition(
              scale: animation,
              child: Icon(
                Icons.check_rounded,
                color: disabled
                    ? const Color(0xFFAFB1B3)
                    : checkIconColor ?? Colors.white,
                size: 20 / 1.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
