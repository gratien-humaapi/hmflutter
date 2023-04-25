// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveAutocompleteRegister(HMFormBuilder builder) {
  builder.defineWidget(AutocompleteProps, (
    FieldMeta props,
    bool Function(AbstractControl<Object?> control)? showErrors,
  ) {
    final customProps = props.customProps as AutocompleteProps;
    return HMReactiveAutocomplete(
      formControlName: props.fieldKey,
      disabled: customProps.disabled,
      showErrors: showErrors,
      fieldMeta: props,
      hidden: customProps.hidden,
      size: customProps.size,
      optionsPaddding: customProps.optionsPaddding,
      radius: customProps.radius,
      selectedIcon: customProps.selectedIcon,
      modalRadius: customProps.modalRadius,
      optionsTextStyle: customProps.optionsTextStyle,
      selectPanelDecoration: customProps.selectPanelDecoration,
      selectedBgColor: customProps.selectedBgColor,
      selectedValueTextStyle: customProps.selectedValueTextStyle,
      isModalView: customProps.isModalView,
      onSelected: customProps.onSelected,
      optionsBuilder: customProps.optionsBuilder,
      optionsViewBuilder: customProps.optionsViewBuilder,
      fieldViewBuilder: customProps.fieldViewBuilder,
      hintText: customProps.hintText,
    );
  });
}
