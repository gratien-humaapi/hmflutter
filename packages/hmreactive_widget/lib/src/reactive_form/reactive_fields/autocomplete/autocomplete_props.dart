import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:hmwidget/size/hm_autocomplete_size.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../props_base.dart';

class AutocompleteProps extends ActionsPropsBase {
  AutocompleteProps({
    bool disabled = false,
    bool hidden = false,
    this.radius,
    this.size,
    this.selectPanelDecoration,
    this.selectedBgColor,
    this.selectedValueTextStyle,
    this.fieldViewBuilder,
    this.modalRadius,
    this.hintText,
    this.optionsTextStyle,
    this.selectedIcon,
    this.isModalView = true,
    required this.onSelected,
    required this.optionsBuilder,
    this.optionsViewBuilder,
    this.showErrors,
    this.optionsPaddding,
  }) : super(disabled, hidden);

  final HMAutocompleteSize? size;
  final HMRadius? radius;
  final ShowErrorsFunction<dynamic>? showErrors;
  final bool isModalView;
  final BoxDecoration? selectPanelDecoration;
  final TextStyle? selectedValueTextStyle;
  final Widget? selectedIcon;
  final TextStyle? optionsTextStyle;
  final double? modalRadius;
  final Color? selectedBgColor;
  final List<String> Function(String value) optionsBuilder;
  final Widget Function(BuildContext context, void Function(String) onSelected,
      List<String> options)? optionsViewBuilder;
  final Widget Function(
      BuildContext context,
      TextEditingController controller,
      bool showClearButton,
      void Function(String value) onChanged)? fieldViewBuilder;
  final void Function(String) onSelected;
  final String? hintText;
  final EdgeInsets? optionsPaddding;
}
