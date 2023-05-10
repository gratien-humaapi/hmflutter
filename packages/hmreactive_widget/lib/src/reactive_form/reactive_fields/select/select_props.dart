import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class SelectProps extends PropsBase {
  SelectProps({
super.disabled,
      super.hidden,
    this.selectIcon,
    this.radius,
    required this.selectList,
    this.size,
    this.selectPanelDecoration,
    this.selectIconColor,
    this.overlayColor,
    this.hintText,
    this.closeIcon,
    this.hasDivider = true,
    this.selectIconAtLeft,
    required this.selectionPageTitle,
    required this.isModalView,
    this.rightIcon,
    this.modalRadius,
    this.selectedBgColor,
    this.selectItemStyle,
    this.selectedValueTextStyle,
    this.onChange,
  }) ;
  final HMSelectSize? size;
  final Widget selectionPageTitle;
  final HMRadius? radius;
  final Widget? selectIcon;
  final Widget? rightIcon;
  final Widget? closeIcon;
  final Color? selectIconColor;
  final Color? overlayColor;
  final double? modalRadius;
  final TextStyle? selectItemStyle;
  final String? hintText;
  final List<dynamic> selectList;
  final BoxDecoration? selectPanelDecoration;
  final TextStyle? selectedValueTextStyle;
  final bool isModalView;
  final bool hasDivider;
  final Color? selectedBgColor;

  /// The position of the selectIcon on the line
  ///`"true"` to put the icon before the title
  ///and `"false"`to put the icon to end.
  final bool? selectIconAtLeft;
  final void Function(String value)? onChange;
}
