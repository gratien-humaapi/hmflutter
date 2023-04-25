import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class MultiSelectProps extends ActionsPropsBase {
  MultiSelectProps({
    final bool disabled = false,
    final bool hidden = false,
    this.radius,
    // required this.multiSelectValue,
    this.selectIcon,
    required this.selectListItem,
    this.size,
    this.selectPanelDecoration,
    this.selectIconColor,
    this.selectIconAtLeft,
    this.fillColor,
    this.direction = Axis.horizontal,
    this.modalRadius,
    required this.selectionPageTitle,
    required this.isModalView,
    this.hintText,
    this.closeIcon,
    this.selectedBgColor,
    this.chipColor,
    this.overlayColor,
    this.hasDivider = true,
    required this.onSelectedValuePressed,
    this.inputIcon,
    this.selectedValueTextStyle,
    this.onChange,
  }) : super(disabled, hidden);

  final HMSelectSize? size;
  final Widget selectionPageTitle;
  final HMRadius? radius;
  final Widget? selectIcon;
  final Widget? closeIcon;
  final Widget? inputIcon;
  final double? modalRadius;
  final Color? overlayColor;
  final Color? chipColor;
  final Color? selectedBgColor;
  final Axis direction;
  final String? hintText;
  final void Function(int index) onSelectedValuePressed;
  final Color? selectIconColor;
  // final List<dynamic> multiSelectValue;
  final List<dynamic> selectListItem;
  final BoxDecoration? selectPanelDecoration;
  final TextStyle? selectedValueTextStyle;
  final bool isModalView;
  final bool hasDivider;
  final Color? fillColor;

  /// The position of the selectIcon on the line
  ///`"true"` to put the icon before the title
  ///and `"false"`to put the icon to end.
  final bool? selectIconAtLeft;
  final void Function(List values)? onChange;
}
