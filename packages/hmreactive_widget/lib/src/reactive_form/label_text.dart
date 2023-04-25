import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String? text;
  final bool isRequired;
  final double? fontSize;
  const InputLabel({
    Key? key,
    required this.text,
    required this.isRequired,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null
        ? RichText(
            text: TextSpan(
              text: '$text ',
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                // fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                isRequired
                    ? const TextSpan(
                        text: '*', style: TextStyle(color: Colors.red))
                    : const TextSpan(),
              ],
            ),
          )
        : Container();
  }
}
