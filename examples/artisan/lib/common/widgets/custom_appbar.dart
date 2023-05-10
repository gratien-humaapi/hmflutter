import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../constant.dart';
import '../size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.isSelecting,
    required this.onDelete,
    required this.selectedItems,
    required this.actions,
    required this.onClose,
    this.hasBackButton = false,
  });

  final String title;
  final List<Widget> actions;
  final int selectedItems;
  final void Function() onClose;
  final void Function() onDelete;
  final bool isSelecting;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      // color: Colors.amber,
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        children: [
          if (hasBackButton && !isSelecting)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: HMIconButton(
                icon: SvgPicture.asset(
                  Assets.icons.arrowLeft,
                  height: 25,
                  width: 25,
                ),
                // fillColor: Colors.red,
                buttonVariant: HMButtonVariant.transparent,
                iconColor: iconColor,
                size: HMIconButtonSize.md,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          isSelecting
              ? SizedBox(
                  width: 100,
                  child: InkWell(
                    onTap: onClose,
                    child: Text(
                      'Annuler',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                      color: titleTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(24)),
                ),
          const Spacer(),
          if (isSelecting)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$selectedItems élément${selectedItems > 1 ? 's' : ''}',
                  style: const TextStyle(color: labelTextColor, fontSize: 14),
                ),
                getProportionateScreenWidth(20).px,
                HMIconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.trash,
                  ),
                  disabled: selectedItems == 0,
                  buttonVariant: HMButtonVariant.transparent,
                  onPressed: onDelete,
                ),
              ],
            )
          else
            SizedBox(
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...actions,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
