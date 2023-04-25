// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveMultiSelectRegister(HMFormBuilder builder) {
  builder.defineWidget(MultiSelectProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as MultiSelectProps;
    return HMReactiveMultiSelect(
      formControlName: props.fieldKey,
      disabled: customProps.disabled,
      hidden: customProps.hidden,
      showErrors: showErrors,
      selectListItem: customProps.selectListItem,
      size: customProps.size,
      hintText: customProps.hintText,
      hasDivider: customProps.hasDivider,
      closeIcon: customProps.closeIcon,
      overlayColor: customProps.overlayColor,
      onSelectedValuePressed: customProps.onSelectedValuePressed,
      chipColor: customProps.chipColor,
      selectedBgColor: customProps.selectedBgColor,
      radius: customProps.radius,
      direction: customProps.direction,
      modalRadius: customProps.modalRadius,
      selectIcon: customProps.selectIcon,
      selectIconColor: customProps.selectIconColor,
      selectionPageTitle: customProps.selectionPageTitle,
      selectPanelDecoration: customProps.selectPanelDecoration,
      fillColor: customProps.fillColor,
      inputIcon: customProps.inputIcon,
      selectedValueTextStyle: customProps.selectedValueTextStyle,
      selectIconAtLeft: customProps.selectIconAtLeft,
      isModalView: customProps.isModalView,
      onChange: customProps.onChange,
    );
  });
}
