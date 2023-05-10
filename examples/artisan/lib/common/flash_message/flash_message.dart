import 'dart:async';

import 'package:artisan/common/constant.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlashMessage extends HookWidget {
  const FlashMessage({
    super.key,
    required this.onDismissed,
  });
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));

    final Animation<double> offsetAnimation = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.6, curve: Curves.easeInCirc),
        reverseCurve: const Threshold(0.0));

    Timer? timer;

    controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          timer = Timer(const Duration(seconds: 3), () {
            if (context.mounted) {
              controller.reverse();
            }
          });
        }
        if (status == AnimationStatus.dismissed) {
          timer?.cancel();
          onDismissed.call();
        }
      },
    );

    controller.forward();

    return FadeTransition(
      opacity: offsetAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 30,
              color: const Color(0xFF3BE442).withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.checkCircle),
            10.px,
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Félicitations!",
                  style: TextStyle(
                      color: Color(0xFF3BE442), fontWeight: FontWeight.bold),
                ),
                Text(
                  "Votre service a été créer avec succès",
                  style: TextStyle(color: labelTextColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
