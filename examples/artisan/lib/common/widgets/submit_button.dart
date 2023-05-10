import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../constant.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.text,
    required this.onPress,
    this.loader = HMLoader.oval,
    this.isLoading = false,
  });
  final String text;
  final void Function() onPress;
  final bool isLoading;
  final HMLoader loader;

  @override
  Widget build(BuildContext context) {
    return HMButton(
      content: text,
      isLoading: isLoading,
      loader: loader,
      // disabled: !form.valid,
      radius: HMRadius.xl,
      size: HMButtonSize.lg,
      fontWeight: FontWeight.w500,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.0, 1.0),
          color: primaryColor.withOpacity(0.6),
          spreadRadius: 0,
          blurRadius: 28,
        ),
      ],
      fillColor: primaryColor,
      textColor: Colors.white,
      fullWidth: true,
      onPressed: onPress,
    );
  }
}
