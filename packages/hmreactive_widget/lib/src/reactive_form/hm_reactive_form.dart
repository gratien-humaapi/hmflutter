import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper(
      {super.key,
      required this.fieldMeta,
      required this.input,
      required this.showErrors});
  final Widget input;
  final FieldMeta fieldMeta;
  final bool Function(AbstractControl<Object?> control)? showErrors;

  bool _showErrors(AbstractControl<Object?> control) {
    if (showErrors != null) {
      return showErrors!(control as FormControl);
    }
    return true;
  }

  findValidationMessage(
      BuildContext context, String errorKey, AbstractControl<Object?> control) {
    final ValidationMessageFunction? validationMessage;
    if (fieldMeta.validationMessages != null &&
        fieldMeta.validationMessages!.containsKey(errorKey)) {
      validationMessage = fieldMeta.validationMessages![errorKey];
    } else {
      final formConfig = ReactiveFormConfig.of(context);
      validationMessage = formConfig?.validationMessages[errorKey];
    }
    return validationMessage != null ? validationMessage(errorKey) : errorKey;
  }

  @override
  Widget build(BuildContext context) {
    // final inputType = fieldMeta.type;
    // final control = form.control(props['fieldKey'] as String);
    return ReactiveValueListenableBuilder(
      formControlName: fieldMeta.fieldKey,
      builder: (context, control, child) {
        String? errorText;
        if (control.hasErrors && _showErrors(control)) {
          final String errorKey = control.errors.keys.first;
          errorText = findValidationMessage(context, errorKey, control);
        }
        // control.getError(errorCode)

        // print('${errorKey}');
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            input,
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 3),
                child: Text(
                  errorText,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
          ],
        );
      },
    );
  }
}

class HMReactiveForm extends StatelessWidget {
  HMReactiveForm({
    super.key,
    required this.form,
    required this.fieldMeta,
    required this.decoratedWidget,
    this.groupNameStyle,
    this.padding,
  }) : assert(fieldMeta.isNotEmpty, "you cannot generate empty form");

  final List<FieldGroup> fieldMeta;
  final Widget Function(Widget child) decoratedWidget;
  final EdgeInsets? padding;
  final HMForm form;
  final TextStyle? groupNameStyle;

  getShowErrors(bool onchange) {
    if (onchange) {
      return (control) => control.invalid && control.dirty || form.isSubmitting;
    } else {
      return (control) => form.isSubmitting;
    }
  }

  @override
  Widget build(BuildContext context) {
    final showErrors = getShowErrors(form.onChangeValidation);
    final HMFormBuilder builder = HMReactiveProvider.of(context).builder;

    return Container(
      padding: padding,
      child: ReactiveForm(
        formGroup: form.form,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (FieldGroup gelement in fieldMeta) ...[
              decoratedWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (gelement.groupName.isNotEmpty)
                      Container(
                        padding: gelement.padding,
                        child: Text(gelement.groupName,
                            style: groupNameStyle ??
                                TextStyle(
                                    fontSize: 18, color: Colors.grey.shade800)),
                      ),
                    // Group inputs
                    Container(
                      padding: gelement.childPadding,
                      // margin: gelement.margin ?? const EdgeInsets.all(2.0),
                      // color: gelement.groupColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          for (var fieldMeta in gelement.fieldsMeta) ...[
                            InputLabel(
                              text: fieldMeta.label,
                              isRequired: fieldMeta.options.isNotEmpty,
                            ),
                            const SizedBox(height: 5),
                            builder.getField(fieldMeta, showErrors),
                            const SizedBox(height: 5.0),
                          ],
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
