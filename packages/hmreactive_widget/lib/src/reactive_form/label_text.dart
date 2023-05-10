import 'package:flutter/material.dart';

/// The widget that displays the label above the field,
/// for example:
///
/// ```dart
/// Column(
///   children: [
///     InputLabel(
///       text: "Username",
///       isRequired: true,
///     ),
///     TextField(
///       decoration: InputDecoration(border: OutlineInputBorder()),
///     ),
///   ],
/// )
/// ```
class InputLabel extends StatelessWidget {
  /// The text to display
  final String? text;

  /// Indicates whether the field is required or not,
  /// if `true` an asterisk is placed in front of the text.
  final bool isRequired;

  /// The label text size
  final double? fontSize;
  const InputLabel({
    Key? key,
    required this.text,
    required this.isRequired,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget label = text != null
        ? RichText(
            text: TextSpan(
              text: '$text ',
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                isRequired
                    ? const TextSpan(
                        text: '*', style: TextStyle(color: Colors.red))
                    : const TextSpan(),
              ],
            ),
          )
        : const SizedBox();
    return label;
  }
}
