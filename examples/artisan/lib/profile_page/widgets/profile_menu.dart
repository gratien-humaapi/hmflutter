import 'package:artisan/common/size_config.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function() onTap;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            10.px,
            icon,
            15.px,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: getProportionateScreenWidth(14),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color(0xFFB4B4B4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
