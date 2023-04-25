import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HMReactiveSelect<T> extends ReactiveFormField<T, String> {
  HMReactiveSelect({
    Key? key,
    required String formControlName,
    bool disabled = false,
    bool hidden = false,
    HMRadius? radius,
    Widget? selectedItemIcon,
    Widget? rightIcon,
    Widget? closeIcon,
    bool Function(FormControl control)? showErrors,
    required List<dynamic> selectList,
    HMSelectSize? size,
    double? modalRadius,
    Color? selectIconColor,
    Color? overlayColor,
    required Widget selectionPageTitle,
    bool? selectIconAtLeft,
    TextStyle? selectedItemStyle,
    String? hintText,
    BoxDecoration? selectPanelDecoration,
    TextStyle? selectedValueTextStyle,
    bool hasDivider = true,
    required bool isModalView,
    Color? selectedBgColor,
    void Function(String value)? onChange,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<T, String> field) {
              // make sure never to pass null value to the Counter widget.
              String fieldValue = field.value ?? "";

              return HMSelect(
                disabled: disabled,
                hidden: hidden,
                value: fieldValue,
                size: size,
                selectedItemIcon: selectedItemIcon,
                rightIcon: rightIcon,
                selectIconColor: selectIconColor,
                selectIconAtLeft: selectIconAtLeft,
                hintText: hintText,
                modalRadius: modalRadius,
                selectList: selectList,
                hasDivider: hasDivider,
                overlayColor: overlayColor,
                radius: radius,
                closeIcon: closeIcon,
                selectionPageTitle: selectionPageTitle,
                selectedItemStyle: selectedItemStyle,
                selectPanelDecoration: selectPanelDecoration,
                selectedValueTextStyle: selectedValueTextStyle,
                isModalView: isModalView,
                selectedBgColor: selectedBgColor,
                onChanged: (dynamic value) {
                  field.didChange(fieldValue = value);
                  onChange?.call(value);
                },
              );
            });

  @override
  ReactiveFormFieldState<T, String> createState() =>
      ReactiveFormFieldState<T, String>();
}
