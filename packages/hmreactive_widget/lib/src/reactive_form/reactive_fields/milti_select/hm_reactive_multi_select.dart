import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveMultiSelect extends ReactiveFormField<dynamic, List> {
  HMReactiveMultiSelect({
    Key? key,
    required String formControlName,
    bool disabled = false,
    bool hidden = false,
    HMRadius? radius,
    String? hintText,
    Widget? selectIcon,
    required List<dynamic> selectListItem,
    HMSelectSize? size,
    Color? selectIconColor,
    Color? selectedBgColor,
    Color? overlayColor,
    Color? chipColor,
    Axis direction = Axis.horizontal,
    double? modalRadius,
    bool Function(FormControl control)? showErrors,
    required Widget selectionPageTitle,
    bool? selectIconAtLeft,
    required void Function(int index) onSelectedValuePressed,
    BoxDecoration? selectPanelDecoration,
    TextStyle? selectedValueTextStyle,
    required bool isModalView,
    bool hasDivider = true,
    void Function(List values)? onChange,
    Color? fillColor,
    Widget? inputIcon,
    Widget? closeIcon,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<dynamic, List> field) {
              // make sure never to pass null value to the Counter widget.
              List fieldValue = field.value ?? [];
              return HMMultiSelect(
                disabled: disabled,
                hidden: hidden,
                hintText: hintText,
                selectedValues: fieldValue,
                size: size,
                selectIcon: selectIcon,
                selectIconColor: selectIconColor,
                fillColor: fillColor,
                chipColor: chipColor,
                inputIcon: inputIcon,
                modalRadius: modalRadius,
                selectedBgColor: selectedBgColor,
                closeIcon: closeIcon,
                direction: direction,
                overlayColor: overlayColor,
                selectIconAtLeft: selectIconAtLeft,
                radius: radius,
                hasDivider: hasDivider,
                selectionPageTitle: selectionPageTitle,
                selectPanelDecoration: selectPanelDecoration,
                selectedValueTextStyle: selectedValueTextStyle,
                isModalView: isModalView,
                selectListItem: selectListItem,
                onSelectedValuePressed: onSelectedValuePressed,
                onChanged: (List value) {
                  field.didChange(fieldValue = value);
                  onChange?.call(value);
                },
              );
            });

  @override
  ReactiveFormFieldState<dynamic, List> createState() =>
      ReactiveFormFieldState<dynamic, List>();
}
