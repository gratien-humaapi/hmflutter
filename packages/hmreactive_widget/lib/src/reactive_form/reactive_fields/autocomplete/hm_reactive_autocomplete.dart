import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';
import 'package:hmwidget/size/hm_autocomplete_size.dart';


class HMReactiveAutocomplete<T> extends ReactiveFormField<T, String> {
  HMReactiveAutocomplete({
    Key? key,
    required String formControlName,
    bool disabled = false,
    bool hidden = false,
    HMAutocompleteSize? size,
    HMRadius? radius,
    bool Function(AbstractControl<Object?> control)? showErrors,
    bool isModalView = true,
    final double? modalRadius,
    final Widget? selectedIcon,
    final TextStyle? optionsTextStyle,
    final EdgeInsets? optionsPaddding,
    BoxDecoration? selectPanelDecoration,
    TextStyle? selectedValueTextStyle,
    Color? selectedBgColor,
    required FieldMeta fieldMeta,
    required List<String> Function(String value) optionsBuilder,
    Widget Function(BuildContext, void Function(String), List<String>)?
        optionsViewBuilder,
    Widget Function(BuildContext, TextEditingController, bool,
            void Function(String value))?
        fieldViewBuilder,
    required void Function(String) onSelected,
    String? hintText,
  }) : super(
            key: key,
            formControlName: formControlName,
            showErrors: showErrors,
            builder: (ReactiveFormFieldState<T, String> field) {
              // make sure never to pass null value to the Counter widget.
              String fieldValue = field.value ?? "";

              return InputWrapper(
                fieldMeta: fieldMeta,
                showErrors: showErrors,
                input: HMAutocomplete(
                  disabled: disabled,
                  hidden: hidden,
                  initialValue: fieldValue,
                  selectedIcon: selectedIcon,
                  optionsTextStyle: optionsTextStyle,
                  optionsPaddding: optionsPaddding,
                  fieldViewBuilder: fieldViewBuilder,
                  modalRadius: modalRadius,
                  hintText: hintText,
                  isModalView: isModalView,
                  optionsViewBuilder: optionsViewBuilder,
                  radius: radius,
                  selectPanelDecoration: selectPanelDecoration,
                  selectedBgColor: selectedBgColor,
                  selectedValueTextStyle: selectedValueTextStyle,
                  size: size,
                  onSelected: (String value) {
                    field.didChange(fieldValue = value);
                    onSelected(value);
                  },
                  optionsBuilder: optionsBuilder,
                ),
              );
            });

  @override
  ReactiveFormFieldState<T, String> createState() =>
      ReactiveFormFieldState<T, String>();
}
