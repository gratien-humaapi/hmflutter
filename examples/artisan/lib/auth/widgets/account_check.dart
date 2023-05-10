import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/constant.dart';

class HaveAccountCheck extends StatelessWidget {
  const HaveAccountCheck(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.onTap});
  final String firstText;
  final String secondText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$firstText  ",
        style: const TextStyle(color: Color(0xFF6D6D6D), fontSize: 14),
        children: [
          TextSpan(
            text: secondText,
            style: const TextStyle(color: primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
