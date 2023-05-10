import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [
                0,
                0.2,
              ],
              colors: [
                // Color(0xFF49A9F8),
                Color(0xffE6F7FF),
                Colors.white,
              ]),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 255, sigmaY: 100),
          child: child,
        ),
      ),
    );
  }
}
