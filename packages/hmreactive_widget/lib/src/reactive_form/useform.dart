import 'package:hmreactive_widget/src/reactive_form/utils/helpers.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'fieldmeta.dart';

/// The hooks that create the form object.
/// It takes three arguments, fieldGroups which is a `List` of `FieldGroups`,
/// onChangeValidation a `boolean` which defines if the form displays errors
/// when modifying or after pressing a button to submit the form.
HMForm<TData> useForm<TData>(
    {required List<FieldGroup> fieldGroups,
    required bool onChangeValidation,
    Map<String, dynamic>? defaultValue}) {
  List<FieldMeta> fieldsMeta = <FieldMeta>[];
  List<Map<String, dynamic>? Function(AbstractControl<dynamic>)> validators =
      [];
  final form = useState(fb.group({}));

  final isSubmitting = useState(false);

  useEffect(() {
    // print("hooks");
    // Extract all fieldmeta fields
    for (var element in fieldGroups) {
      if (element.validators != null) {
        validators.addAll(element.validators
            as Iterable<Map<String, dynamic>? Function(AbstractControl p1)>);
      }
      for (var element in element.fieldsMeta) {
        fieldsMeta.add(element);
      }
    }
    form.value = buildForm(fieldsMeta);

    form.value.setValidators(validators);

    if (defaultValue != null) form.value.value = defaultValue;
    return null;
  }, []);

  handleSubmit<TData>(void Function(TData data) onSubmit) async {
    isSubmitting.value = true;
    form.value.markAllAsTouched();

    if (!form.value.hasErrors) {
      final TData data = form.value.value as TData;
      onSubmit(data);
    }
  }

  HMForm<TData> methods = HMForm(
      form: form.value,
      isSubmitting: isSubmitting.value,
      handleSubmit: handleSubmit,
      onChangeValidation: onChangeValidation);

  return methods;
}

class HMForm<TData> {
  final FormGroup form;
  bool isSubmitting;
  final bool onChangeValidation;
  final void Function(void Function(TData data) onSubmit) handleSubmit;
  HMForm({
    required this.form,
    required this.isSubmitting,
    required this.handleSubmit,
    required this.onChangeValidation,
  });
}
