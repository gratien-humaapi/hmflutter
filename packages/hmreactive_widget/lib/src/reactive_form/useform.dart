import 'package:hmreactive_widget/src/reactive_form/utils/helpers.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'fieldmeta.dart';

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

  // form = buildForm(fieldsMeta);
  // print('here is form : ${form.value.value}');

  handleSubmit<TData>(void Function(TData data) onSubmit) async {
    isSubmitting.value = true;
    // print('markAllas Touched');
    form.value.markAllAsTouched();
    // await Future.delayed(const Duration(seconds: 5)).then(
    //   (value) => print('yes submit'),
    //   //SignUpConfirmationRoute().go(context),
    // );
    if (!form.value.hasErrors) {
      final TData data = form.value.value as TData;
      onSubmit(data);
    }
    // print('markAllas finish');
    // isSubmitting.value = false;
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
