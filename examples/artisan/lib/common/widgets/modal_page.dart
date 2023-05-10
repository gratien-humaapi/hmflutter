import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalPage extends Page<void> {
  /// A page to display a dialog.
  const ModalPage({required this.child, super.key});

  /// The widget to be displayed which is usually a [Dialog] widget.
  final Widget child;

  @override
  Route<void> createRoute(BuildContext context) {
    return CupertinoModalPopupRoute(
      barrierColor: const Color(0xFFE0E0E0).withOpacity(0.3),
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      barrierDismissible: true,
      semanticsDismissible: true,
      settings: this,
      builder: (BuildContext context) => FractionallySizedBox(
        heightFactor: 0.9,
        child: Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: child,
        ),
      ),
    );
  }
}
