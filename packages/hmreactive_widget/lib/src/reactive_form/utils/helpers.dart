import '../../../hmreactive_widget.dart';

_checkContains(List splitValue, int i, FormGroup form, [String same = '']) {
  String sameValue = same;
  int iValue = i;
  String searchWord = splitValue.getRange(0, iValue).join('.');
  // print(searchWord);
  if (iValue == 0) {
    // print("same: $sameValue");
    return sameValue;
  }

  if (!(form.findControl(searchWord) == null)) {
    iValue = 0;
    sameValue = searchWord;
    // print("yes same: $sameValue");
  } else {
    iValue = iValue - 1;
  }

  return _checkContains(splitValue, iValue, form, sameValue);
}

_recursiveFormBuilder(
    {required String input,
    required List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>
        options,
    fbGroup,
    int index = 0}) {
  String reverseInput = '';
  FormGroup group = FormGroup({});

  if (!input.contains('.')) {
    if (fbGroup == null) {
      return [...options];
    } else {
      return fbGroup;
    }
  }

  if (index < 1) {
    reverseInput = input.split('.').reversed.join('.');
    // print('reverse input: $reverseInput');
  } else {
    reverseInput = input;
  }

  final int indexOfDotOne = reverseInput.indexOf('.');

  final String controlName = reverseInput.substring(0, indexOfDotOne);
  final List<String> reverseInputArray = reverseInput.split('.');
  final String subStringInput =
      reverseInputArray.getRange(1, reverseInputArray.length).join('.');
  // Group Name
  if (subStringInput.contains('.')) {
    final int indexOfDotTwo = subStringInput.indexOf('.');
    final String groupName = subStringInput.substring(0, indexOfDotTwo);
    if (fbGroup == null) {
      group = fb.group({
        groupName: fb.group({
          controlName: [...options]
          // buildFormControl(defaultVal, options)
        })
      });
      // print("null : ${group.value}");
    } else {
      // print("i am : $fbGroup");
      group = fb.group({groupName: fbGroup});
    }
  } else {
    // print("i am else : $fbGroup");
    if (fbGroup == null) {
      group = fb.group({
        controlName: [...options]
      });
    } else {
      group = fbGroup as FormGroup;
    }
  }
  // print("this is $subStringInput");
  return _recursiveFormBuilder(
      input: subStringInput.split('.').reversed.join('.'),
      // defaultVal: defaultVal,
      fbGroup: group,
      options: options,
      index: index++);
}

FormGroup buildForm(List<FieldMeta> fieldsMetaList) {
  List<FieldMeta> fields = [];
  FormGroup form = fb.group({});
  // findDublicates(fieldsMeta);
  for (var element in fieldsMetaList) {
    if (element.subscribe == true) {
      fields.add(element);
    }
  }
  // print(fields);

  for (FieldMeta item in fields) {
    List<String> split2 = item.fieldKey.split('.');
    final String check = _checkContains(split2, split2.length, form) as String;
    // print("check: $check");
    if (check.isEmpty) {
      var a = _recursiveFormBuilder(
          input: item.fieldKey,
          // defaultVal: getDefaultValue(split2), //item.defaultValue,
          options: item.options);
      var c = fb.group({
        item.fieldKey.split('.').first: a,
      });
      form.addAll(c.controls);

      // print(form.value);
    } else if (check == item.fieldKey) {
      // print('doublon');
    } else {
      // print("chemin: $check");
      String input = item.fieldKey.split('$check.').join('.');
      // print("input: $input");
      var a = _recursiveFormBuilder(
          input: input,
          // defaultVal: getDefaultValue(split2),
          options: item.options);
      // print("a: ${a.value}");
      (form.control(check) as FormGroup)
          .addAll(a.controls as Map<String, AbstractControl<dynamic>>);
    }
  }
  // print(form.value);
  return form;
}
