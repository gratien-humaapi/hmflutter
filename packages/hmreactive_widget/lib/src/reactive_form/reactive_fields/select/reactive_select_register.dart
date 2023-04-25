// ignore_for_file: non_constant_identifier_names

import 'package:hmreactive_widget/hmreactive_widget.dart';


ReactiveSelectRegister(HMFormBuilder builder) {
  builder.defineWidget(SelectProps,
      (FieldMeta props, bool Function(FormControl control)? showErrors) {
    final customProps = props.customProps as SelectProps;
    return HMReactiveSelect(
      formControlName: props.fieldKey,
      disabled: customProps.disabled,
      showErrors: showErrors,
      hidden: customProps.hidden,
      size: customProps.size,
      selectIconColor: customProps.selectIconColor,
      modalRadius: customProps.modalRadius,
      selectIconAtLeft: customProps.selectIconAtLeft,
      selectList: customProps.selectList,
      hasDivider: customProps.hasDivider,
      overlayColor: customProps.overlayColor,
      closeIcon: customProps.closeIcon,
      hintText: customProps.hintText,
      rightIcon: customProps.rightIcon,
      selectedItemIcon: customProps.selectIcon,
      radius: customProps.radius,
      selectionPageTitle: customProps.selectionPageTitle,
      selectedItemStyle: customProps.selectItemStyle,
      selectPanelDecoration: customProps.selectPanelDecoration,
      selectedBgColor: customProps.selectedBgColor,
      selectedValueTextStyle: customProps.selectedValueTextStyle,
      isModalView: customProps.isModalView,
      onChange: customProps.onChange,
    );
  });
}
