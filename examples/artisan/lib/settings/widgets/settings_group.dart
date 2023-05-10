import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constant.dart';
import '../../common/size_config.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    super.key,
    required this.groupTitle,
    required this.settingsOptions,
  });
  final String groupTitle;
  final List<SettingsOption> settingsOptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8)),
            child: Text(
              groupTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: titleTextColor,
                  fontSize: getProportionateScreenWidth(16)),
            ),
          ),
          8.py,
          ...settingsOptions,
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    super.key,
    required this.title,
    this.onTap,
    this.isRoute = true,
  });
  final Widget title;
  final void Function()? onTap;
  final bool isRoute;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: getProportionateScreenHeight(50),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: titleTextColor,
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.w400),
                  child: title),
            ),
            if (isRoute) SvgPicture.asset(Assets.icons.arrowRight),
          ],
        ),
      ),
    );
  }
}
